#!/bin/bash
# CI script: Check overlay packages against gentoo portage
# No network access required - uses local portage tree only
#
# Usage: refresh-overlay.sh [options] [overlay-path]
#
# Options:
#   --check-only    Only report, don't make changes or run tests
#   --auto-remove   Automatically remove packages available in portage stable
#   --package PKG   Only process a specific package
#   --quiet         Minimal output
#   --help          Show this help

set -eo pipefail

# Source Gentoo functions for output
if [[ -f /lib/gentoo/functions.sh ]]; then
	_saved_args=("$@")
	set --
	source /lib/gentoo/functions.sh
	set -- "${_saved_args[@]}"
	unset _saved_args
else
	einfo() { echo " * $*"; }
	ewarn() { echo " * $*" >&2; }
	eerror() { echo " * $*" >&2; }
	ebegin() { echo " * $* ..."; }
	eend() { [[ $1 -eq 0 ]] && echo "   [ ok ]" || echo "   [ !! ]"; return $1; }
	eindent() { :; }
	eoutdent() { :; }
	GOOD="" BAD="" WARN="" HILITE="" NORMAL="" BRACKET=""
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CHECK_ONLY=false
AUTO_REMOVE=false
SINGLE_PACKAGE=""
OVERLAY_ROOT=""

while [[ $# -gt 0 ]]; do
	case "$1" in
		--check-only) CHECK_ONLY=true; shift ;;
		--auto-remove) AUTO_REMOVE=true; shift ;;
		--package) SINGLE_PACKAGE="$2"; shift 2 ;;
		--quiet) EINFO_QUIET=yes; shift ;;
		--help|-h) head -14 "$0" | tail -12; exit 0 ;;
		-*) eerror "Unknown option: $1"; exit 1 ;;
		*) OVERLAY_ROOT="$1"; shift ;;
	esac
done

# Find overlay root
if [[ -z "$OVERLAY_ROOT" ]]; then
	if [[ -f "./metadata/layout.conf" ]]; then
		OVERLAY_ROOT="$(pwd)"
	elif [[ -f "$SCRIPT_DIR/../metadata/layout.conf" ]]; then
		OVERLAY_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
	else
		eerror "Could not find overlay root. Specify path or run from overlay directory."
		exit 1
	fi
fi

OVERLAY_ROOT="$(realpath "$OVERLAY_ROOT")"
[[ -f "$OVERLAY_ROOT/metadata/layout.conf" ]] || { eerror "Not a valid overlay: $OVERLAY_ROOT"; exit 1; }

OVERLAY_NAME=$(cat "$OVERLAY_ROOT/profiles/repo_name" 2>/dev/null || basename "$OVERLAY_ROOT")

# Get packages in overlay
get_overlay_packages() {
	find "$OVERLAY_ROOT" -name "*.ebuild" -type f | while read -r ebuild; do
		local rel_path="${ebuild#$OVERLAY_ROOT/}"
		local category=$(echo "$rel_path" | cut -d'/' -f1)
		local package=$(echo "$rel_path" | cut -d'/' -f2)
		[[ "$category" =~ ^(metadata|profiles|scripts|sets|\..*|eclass)$ ]] && continue
		echo "$category/$package"
	done | sort -u
}

# Get highest non-live version from overlay
get_our_version() {
	local pkg_dir="$1"
	local pkg_name=$(basename "$pkg_dir")
	local highest=""
	for ebuild in "$pkg_dir"/*.ebuild; do
		[[ -f "$ebuild" ]] || continue
		local ver=$(basename "$ebuild" .ebuild | sed "s/^${pkg_name}-//")
		[[ "$ver" == "9999" ]] && continue
		if [[ -z "$highest" ]] || [[ "$(printf '%s\n' "$ver" "$highest" | sort -V | tail -1)" == "$ver" ]]; then
			highest="$ver"
		fi
	done
	echo "$highest"
}

# Compare versions (returns 0 if v1 >= v2)
version_gte() {
	[[ "$(printf '%s\n' "$1" "$2" | sort -V | tail -1)" == "$1" ]]
}

# Remove package from overlay
remove_package() {
	local pkg="$1"
	local pkg_dir="$OVERLAY_ROOT/$pkg"

	ebegin "Removing ${pkg}"
	if rm -rf "$pkg_dir"; then
		eend 0
		return 0
	else
		eend 1
		return 1
	fi
}

# Check gentoo portage using qgrep
get_portage_info() {
	local pkg="$1"
	local gentoo_data
	gentoo_data=$(qgrep -N -R "KEYWORDS" "$pkg" 2>/dev/null | grep "::gentoo:" || true)

	[[ -z "$gentoo_data" ]] && { echo "false||"; return 0; }

	local highest_stable="" highest_testing=""
	while IFS= read -r line; do
		local atom="${line%%::gentoo:*}"
		local version="${atom##*-}"
		[[ "$version" =~ ^r[0-9]+$ ]] && { local temp="${atom%-r*}"; version="${temp##*-}-${version}"; }

		local keywords="${line#*KEYWORDS=\"}"
		keywords="${keywords%\"*}"

		if [[ " $keywords " =~ " amd64 " ]]; then
			[[ -z "$highest_stable" || "$(printf '%s\n' "$version" "$highest_stable" | sort -V | tail -1)" == "$version" ]] && highest_stable="$version"
		fi
		if [[ " $keywords " =~ " ~amd64 " ]]; then
			[[ -z "$highest_testing" || "$(printf '%s\n' "$version" "$highest_testing" | sort -V | tail -1)" == "$version" ]] && highest_testing="$version"
		fi
	done <<< "$gentoo_data"

	echo "true|${highest_stable}|${highest_testing}"
}

# Main
main() {
	local packages
	[[ -n "$SINGLE_PACKAGE" ]] && packages="$SINGLE_PACKAGE" || packages=$(get_overlay_packages)

	local total=0 can_remove=0 up_to_date=0 errors=0
	local removed=0

	einfo "Scanning overlay: ${HILITE}${OVERLAY_NAME}${NORMAL} (${OVERLAY_ROOT})"
	[[ "$AUTO_REMOVE" == "true" ]] && einfo "Auto-remove: ${GOOD}enabled${NORMAL}"
	echo

	while IFS= read -r pkg; do
		[[ -z "$pkg" ]] && continue
		total=$((total + 1))

		# Process each package with error handling to continue on failure
		_process_result=0
		{
			local pkg_dir="$OVERLAY_ROOT/$pkg"
			local our_version=$(get_our_version "$pkg_dir")

			einfo "Checking ${HILITE}${pkg}${NORMAL}"
			eindent

			if [[ -z "$our_version" ]]; then
				einfo "Version: ${WARN}live only (9999)${NORMAL}"
			else
				einfo "Version: ${our_version}"
			fi

			# Check gentoo portage
			ebegin "Checking gentoo portage"
			local portage_info=$(get_portage_info "$pkg")
			eend 0

			local in_portage="${portage_info%%|*}"
			local rest="${portage_info#*|}"
			local stable_version="${rest%%|*}"
			local testing_version="${rest#*|}"

			if [[ "$in_portage" == "true" ]]; then
				if [[ -n "$stable_version" ]]; then
					einfo "Portage: ${GOOD}${stable_version}${NORMAL} (stable)"
				elif [[ -n "$testing_version" ]]; then
					einfo "Portage: ${WARN}${testing_version}${NORMAL} (testing only)"
				else
					einfo "Portage: ${WARN}not keyworded for amd64${NORMAL}"
				fi
			else
				einfo "Portage: ${WARN}not in gentoo tree${NORMAL}"
			fi

			# Determine status
			local status="ok"
			if [[ "$in_portage" == "true" && -n "$stable_version" && -n "$our_version" ]]; then
				version_gte "$stable_version" "$our_version" && status="can_remove"
			fi

			case "$status" in
				can_remove)
					einfo "Status: ${WARN}REMOVABLE${NORMAL} - Portage stable ${stable_version} >= our ${our_version}"
					if [[ "$AUTO_REMOVE" == "true" && "$CHECK_ONLY" != "true" ]]; then
						if remove_package "$pkg"; then
							removed=$((removed + 1))
						else
							_process_result=1
						fi
					else
						can_remove=$((can_remove + 1))
					fi
					;;
				*)
					einfo "Status: ${GOOD}up to date${NORMAL}"
					up_to_date=$((up_to_date + 1))
					;;
			esac

			# Run tests if not check-only
			if [[ "$CHECK_ONLY" != "true" ]]; then
				ebegin "Testing ebuild"
				if [[ -x "$SCRIPT_DIR/test-ebuild.sh" ]]; then
					"$SCRIPT_DIR/test-ebuild.sh" "$pkg_dir" >/dev/null 2>&1 && eend 0 || { eend 1 || true; _process_result=1; }
				else
					eend 0 "skipped"
				fi
			fi

			eoutdent
		} || {
			# Catch any unexpected errors
			eerror "Unexpected error processing ${pkg}"
			eoutdent 2>/dev/null || true
			_process_result=1
		}

		[[ $_process_result -ne 0 ]] && errors=$((errors + 1))
		echo
	done <<< "$packages"

	einfo "Summary for ${HILITE}${OVERLAY_NAME}${NORMAL}:"
	eindent
	einfo "Total packages: ${total}"
	einfo "Up to date: ${GOOD}${up_to_date}${NORMAL}"
	[[ $can_remove -gt 0 ]] && ewarn "Can remove: ${can_remove}"
	[[ $removed -gt 0 ]] && einfo "Removed: ${GOOD}${removed}${NORMAL}"
	[[ $errors -gt 0 ]] && eerror "Errors: ${errors}"
	eoutdent

	[[ $errors -gt 0 ]] && exit 1
	exit 0
}

main
