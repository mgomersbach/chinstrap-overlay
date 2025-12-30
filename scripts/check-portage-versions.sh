#!/bin/bash
# Check package availability in official Gentoo portage tree
# Checks keyword status (stable/testing) for specified architectures
#
# Usage: check-portage-versions.sh <category/package> [arch1,arch2,...]
# Example: check-portage-versions.sh dev-python/pydantic amd64,arm64
#
# Requires: app-portage/portage-utils (qgrep)
#
# Output format (JSON):
# {
#   "package": "cat/pkg",
#   "in_portage": true,
#   "arches": {
#     "amd64": {"stable": "1.0.0", "testing": "1.1.0"},
#     "arm64": {"stable": null, "testing": "1.1.0"}
#   }
# }

set -eo pipefail

PACKAGE="${1:-}"
ARCHES="${2:-amd64,arm64}"

if [[ -z "$PACKAGE" ]]; then
	echo "Usage: $0 <category/package> [arch1,arch2,...]" >&2
	exit 1
fi

# Validate package format
if [[ ! "$PACKAGE" =~ ^[a-z0-9_-]+/[a-zA-Z0-9_+-]+$ ]]; then
	echo "Error: Invalid package format. Expected: category/package" >&2
	exit 1
fi

PKG_NAME="${PACKAGE##*/}"

# Get KEYWORDS from gentoo repo only using qgrep
# Output format: category/package-version::gentoo:KEYWORDS="..."
GENTOO_DATA=$(qgrep -N -R "KEYWORDS" "$PACKAGE" 2>/dev/null | grep "::gentoo:" || true)

if [[ -z "$GENTOO_DATA" ]]; then
	echo "{\"package\": \"${PACKAGE}\", \"in_portage\": false, \"arches\": {}}"
	exit 0
fi

# Parse arches into array
IFS=',' read -ra ARCH_ARRAY <<< "$ARCHES"

# For each arch, find the highest stable and testing versions
declare -A STABLE_VERSIONS
declare -A TESTING_VERSIONS

while IFS= read -r line; do
	# Extract version: category/package-VERSION::gentoo:KEYWORDS="..."
	atom="${line%%::gentoo:*}"
	version="${atom##*-}"
	# Handle versions like 1.0.0-r1
	if [[ "$version" =~ ^r[0-9]+$ ]]; then
		# This is a revision, need to get the real version
		temp="${atom%-r*}"
		version="${temp##*-}-${version}"
	fi

	keywords="${line#*KEYWORDS=\"}"
	keywords="${keywords%\"*}"

	for arch in "${ARCH_ARRAY[@]}"; do
		# Check for stable (exact match for arch)
		if [[ " $keywords " =~ " $arch " ]]; then
			current="${STABLE_VERSIONS[$arch]:-}"
			if [[ -z "$current" ]] || [[ "$(printf '%s\n' "$version" "$current" | sort -V | tail -1)" == "$version" ]]; then
				STABLE_VERSIONS[$arch]="$version"
			fi
		fi
		# Check for testing (~arch)
		if [[ " $keywords " =~ " ~$arch " ]]; then
			current="${TESTING_VERSIONS[$arch]:-}"
			if [[ -z "$current" ]] || [[ "$(printf '%s\n' "$version" "$current" | sort -V | tail -1)" == "$version" ]]; then
				TESTING_VERSIONS[$arch]="$version"
			fi
		fi
	done
done <<< "$GENTOO_DATA"

# Build JSON output
echo -n "{\"package\": \"${PACKAGE}\", \"in_portage\": true, \"arches\": {"

FIRST_ARCH=true
for arch in "${ARCH_ARRAY[@]}"; do
	if [[ "$FIRST_ARCH" == "true" ]]; then
		FIRST_ARCH=false
	else
		echo -n ", "
	fi

	stable="${STABLE_VERSIONS[$arch]:-}"
	testing="${TESTING_VERSIONS[$arch]:-}"

	echo -n "\"${arch}\": {"
	if [[ -n "$stable" ]]; then
		echo -n "\"stable\": \"${stable}\""
	else
		echo -n "\"stable\": null"
	fi
	echo -n ", "
	if [[ -n "$testing" ]]; then
		echo -n "\"testing\": \"${testing}\""
	else
		echo -n "\"testing\": null"
	fi
	echo -n "}"
done

echo "}}"
