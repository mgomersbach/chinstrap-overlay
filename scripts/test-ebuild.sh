#!/bin/bash
# Test and validate an ebuild using pkgcheck and pkgdev
# Usage: test-ebuild.sh [path-to-ebuild-or-package-dir]
# Example: test-ebuild.sh games-emulation/dosbox-x
# If no argument is given, all packages in the overlay are tested.
#
# Exit codes:
#   0 - All checks passed
#   1 - Errors found
#   2 - Usage error

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

# Find the overlay root (directory containing metadata/layout.conf)
find_overlay_root() {
	local dir="$1"
	while [[ "$dir" != "/" ]]; do
		if [[ -f "$dir/metadata/layout.conf" ]]; then
			echo "$dir"
			return 0
		fi
		dir=$(dirname "$dir")
	done
	return 1
}

# Test a single package directory
# Returns 0 on success, 1 on error
test_package() {
	local PKG_DIR="$1"
	local PKG_NAME PKG_CAT ERRORS=0

	PKG_NAME=$(basename "$PKG_DIR")
	PKG_CAT=$(basename "$(dirname "$PKG_DIR")")

	einfo "Testing ${HILITE}${PKG_CAT}/${PKG_NAME}${NORMAL}"
	eindent

	# Step 1: Generate/update Manifest
	ebegin "Generating Manifest"
	cd "$PKG_DIR"
	if command -v pkgdev &>/dev/null; then
		if pkgdev manifest >/dev/null 2>&1; then
			eend 0
		else
			eend 1 "Manifest generation failed"
			ERRORS=$((ERRORS + 1))
		fi
	else
		# Fallback to ebuild command
		for ebuild in *.ebuild; do
			if [[ -f "$ebuild" ]]; then
				if ebuild "$ebuild" manifest >/dev/null 2>&1; then
					eend 0
				else
					eend 1 "Manifest generation failed"
					ERRORS=$((ERRORS + 1))
				fi
				break
			fi
		done
	fi

	# Step 2: Run pkgcheck
	ebegin "Running pkgcheck scan"
	cd "$PKG_DIR"
	if command -v pkgcheck &>/dev/null; then
		PKGCHECK_OUTPUT=$(pkgcheck scan 2>&1) || true
		if [[ -n "$PKGCHECK_OUTPUT" ]]; then
			# Check for errors (not just warnings)
			if echo "$PKGCHECK_OUTPUT" | grep -qiE '\b(error|Error)\b'; then
				eend 1
				eindent
				echo "$PKGCHECK_OUTPUT" | while read -r line; do
					[[ -n "$line" ]] && ewarn "$line"
				done
				eoutdent
				ERRORS=$((ERRORS + 1))
			else
				eend 0
				# Show warnings if any
				if [[ -n "$PKGCHECK_OUTPUT" ]]; then
					eindent
					echo "$PKGCHECK_OUTPUT" | while read -r line; do
						[[ -n "$line" ]] && einfo "$line"
					done
					eoutdent
				fi
			fi
		else
			eend 0
		fi
	else
		eend 0 "skipped (pkgcheck not installed)"
	fi

	# Step 3: Basic ebuild syntax check
	ebegin "Checking ebuild syntax"
	SYNTAX_OK=true
	for ebuild in *.ebuild; do
		if [[ -f "$ebuild" ]]; then
			if ! bash -n "$ebuild" 2>/dev/null; then
				SYNTAX_OK=false
				break
			fi
		fi
	done

	if [[ "$SYNTAX_OK" == "true" ]]; then
		eend 0
	else
		eend 1 "Syntax error in ebuild"
		ERRORS=$((ERRORS + 1))
	fi

	eoutdent
	return $ERRORS
}

TARGET="${1:-}"
TOTAL_ERRORS=0

if [[ -n "$TARGET" ]]; then
	# Single package mode
	if [[ -f "$TARGET" ]]; then
		PKG_DIR=$(dirname "$(realpath "$TARGET")")
	elif [[ -d "$TARGET" ]]; then
		PKG_DIR=$(realpath "$TARGET")
	elif [[ -d "./$TARGET" ]]; then
		PKG_DIR=$(realpath "./$TARGET")
	else
		eerror "Target not found: $TARGET"
		exit 2
	fi

	OVERLAY_ROOT=$(find_overlay_root "$PKG_DIR") || {
		eerror "Could not find overlay root (no metadata/layout.conf found)"
		exit 2
	}

	test_package "$PKG_DIR" || TOTAL_ERRORS=$((TOTAL_ERRORS + 1))
else
	# All packages mode
	SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
	OVERLAY_ROOT=$(find_overlay_root "$SCRIPT_DIR") || {
		eerror "Could not find overlay root (no metadata/layout.conf found)"
		exit 2
	}

	einfo "Testing all packages in ${HILITE}${OVERLAY_ROOT}${NORMAL}"

	while IFS= read -r pkg_dir; do
		test_package "$pkg_dir" || TOTAL_ERRORS=$((TOTAL_ERRORS + 1))
	done < <(find "$OVERLAY_ROOT" -name "*.ebuild" -printf '%h\n' | sort -u)
fi

# Summary
if [[ $TOTAL_ERRORS -eq 0 ]]; then
	einfo "Result: ${GOOD}All checks passed${NORMAL}"
	exit 0
else
	eerror "Result: ${TOTAL_ERRORS} error(s) found"
	exit 1
fi
