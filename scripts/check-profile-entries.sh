#!/bin/bash
set -o pipefail

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
  eend() {
    [[ $1 -eq 0 ]] && echo "   [ ok ]" || echo "   [ !! ]"
    return "$1"
  }
  eindent() { :; }
  eoutdent() { :; }
  GOOD="" HILITE="" NORMAL=""
fi

ARCH=$(portageq envvar ARCH 2>/dev/null || echo "amd64")
ISSUES=0

declare -A CACHE_PKG_EXISTS
declare -A CACHE_PKG_STABLE
declare -A CACHE_PKG_IUSE
declare -A CACHE_PKG_IUSE_DEFAULTS

find_overlay_root() {
  local dir="$1"
  while [[ $dir != "/" ]]; do
    if [[ -f "$dir/metadata/layout.conf" ]]; then
      echo "$dir"
      return 0
    fi
    dir=$(dirname "$dir")
  done
  return 1
}

build_repo_cache_dirs() {
  local repos repo_path
  repos=$(portageq get_repos / 2>/dev/null) || repos="gentoo"
  for repo in $repos; do
    repo_path=$(portageq get_repo_path / "$repo" 2>/dev/null) || continue
    local cache_dir="${repo_path}/metadata/md5-cache"
    [[ -d $cache_dir ]] && echo "$cache_dir"
  done
}

REPO_CACHE_DIRS=$(build_repo_cache_dirs)

atom_to_catpkg() {
  qatom -F '%{CATEGORY}/%{PN}' "$1" 2>/dev/null
}

list_cache_files() {
  local catpkg="$1"
  local cat="${catpkg%/*}"
  local pkg="${catpkg#*/}"
  for cache_dir in $REPO_CACHE_DIRS; do
    local dir="${cache_dir}/${cat}"
    [[ -d $dir ]] || continue
    for f in "${dir}/${pkg}"-[0-9]*; do
      [[ -f $f ]] || continue
      # Verify PN matches (avoid foo matching foo-bar)
      local basename="${f##*/}"
      local file_catpkg
      file_catpkg=$(qatom -F '%{CATEGORY}/%{PN}' "${cat}/${basename}" 2>/dev/null)
      [[ $file_catpkg == "$catpkg" ]] && echo "$f"
    done
  done
}

pkg_exists() {
  local catpkg="$1"
  if [[ -n ${CACHE_PKG_EXISTS[$catpkg]+x} ]]; then
    return "${CACHE_PKG_EXISTS[$catpkg]}"
  fi
  local files
  files=$(list_cache_files "$catpkg")
  if [[ -n $files ]]; then
    CACHE_PKG_EXISTS[$catpkg]=0
    return 0
  fi
  CACHE_PKG_EXISTS[$catpkg]=1
  return 1
}

pkg_has_stable() {
  local catpkg="$1"
  if [[ -n ${CACHE_PKG_STABLE[$catpkg]+x} ]]; then
    return "${CACHE_PKG_STABLE[$catpkg]}"
  fi
  local cat="${catpkg%/*}"
  local pkg="${catpkg#*/}"

  local gentoo_cache
  gentoo_cache=$(portageq get_repo_path / gentoo 2>/dev/null)/metadata/md5-cache
  if [[ -d "${gentoo_cache}/${cat}" ]]; then
    for f in "${gentoo_cache}/${cat}/${pkg}"-[0-9]*; do
      [[ -f $f ]] || continue
      local file_catpkg
      file_catpkg=$(qatom -F '%{CATEGORY}/%{PN}' "${cat}/${f##*/}" 2>/dev/null)
      [[ $file_catpkg == "$catpkg" ]] || continue
      local keywords
      keywords=$(grep '^KEYWORDS=' "$f" 2>/dev/null | sed 's/^KEYWORDS=//') || continue
      # Check for stable arch: ARCH as a standalone word not preceded by ~
      if [[ " ${keywords} " == *" ${ARCH} "* ]]; then
        CACHE_PKG_STABLE[$catpkg]=0
        return 0
      fi
    done
  fi
  CACHE_PKG_STABLE[$catpkg]=1
  return 1
}

versioned_atom_exists() {
  local atom="$1"

  portageq match / "$atom" >/dev/null 2>&1
}

pkg_get_iuse() {
  local catpkg="$1"
  if [[ -n ${CACHE_PKG_IUSE[$catpkg]+x} ]]; then
    echo "${CACHE_PKG_IUSE[$catpkg]}"
    return
  fi
  local all_iuse=""
  while IFS= read -r f; do
    local iuse
    iuse=$(grep '^IUSE=' "$f" 2>/dev/null | sed 's/^IUSE=//') || continue
    all_iuse="$all_iuse $iuse"
  done < <(list_cache_files "$catpkg")

  local defaults
  defaults=$(echo "$all_iuse" | tr ' ' '\n' | grep '^+' | sed 's/^+//' | sort -u | tr '\n' ' ')
  CACHE_PKG_IUSE_DEFAULTS[$catpkg]="$defaults"

  all_iuse=$(echo "$all_iuse" | tr ' ' '\n' | sed 's/^[+-]//' | sort -u | tr '\n' ' ')
  CACHE_PKG_IUSE[$catpkg]="$all_iuse"
  echo "$all_iuse"
}

pkg_get_iuse_defaults() {
  local catpkg="$1"

  if [[ -z ${CACHE_PKG_IUSE[$catpkg]+x} ]]; then
    pkg_get_iuse "$catpkg" >/dev/null
  fi
  echo "${CACHE_PKG_IUSE_DEFAULTS[$catpkg]}"
}

read_entries() {
  local file="$1"
  [[ -f $file ]] || return
  while IFS= read -r line; do

    line="${line%%#*}"

    [[ -n ${line// /} ]] || continue

    echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
  done <"$file"
}

get_all_files() {
  local path="$1"
  if [[ -f $path ]]; then
    echo "$path"
  elif [[ -d $path ]]; then
    find "$path" -type f | sort
  fi
}

check_keywords_entry() {
  local rel_file="$1"
  local line="$2"

  local atom="${line%% *}"
  local catpkg
  catpkg=$(atom_to_catpkg "$atom") || return
  [[ -n $catpkg ]] || return

  if ! pkg_exists "$catpkg"; then
    ewarn "${HILITE}${rel_file}${NORMAL}: ${atom}: package not found in any repository"
    ISSUES=$((ISSUES + 1))
    return
  fi

  if [[ $atom == *-[0-9]* ]] && [[ $atom == [=\<\>~]* ]]; then
    if ! versioned_atom_exists "$atom"; then
      ewarn "${HILITE}${rel_file}${NORMAL}: ${atom}: version no longer exists"
      ISSUES=$((ISSUES + 1))
      return
    fi
  fi

  if pkg_has_stable "$catpkg"; then
    if [[ $atom == [=\<\>~]* ]]; then
      ewarn "${HILITE}${rel_file}${NORMAL}: ${atom}: stable version available in gentoo"
      ISSUES=$((ISSUES + 1))
    elif [[ $CHECK_ALL_STABLE == true ]]; then
      einfo "${HILITE}${rel_file}${NORMAL}: ${atom}: stable version available in gentoo"
    fi
  fi
}

check_use_entry() {
  local rel_file="$1"
  local line="$2"

  local atom flags
  read -r atom flags <<<"$line"
  [[ -n $flags ]] || return

  local catpkg
  catpkg=$(atom_to_catpkg "$atom") || return
  [[ -n $catpkg ]] || return

  if ! pkg_exists "$catpkg"; then
    ewarn "${HILITE}${rel_file}${NORMAL}: ${atom}: package not found in any repository"
    ISSUES=$((ISSUES + 1))
    return
  fi

  local iuse
  iuse=$(pkg_get_iuse "$catpkg")
  [[ -n $iuse ]] || return

  local bad_flags=""
  for flag in $flags; do

    local clean_flag="${flag#-}"

    if ! echo " $iuse " | grep -q " ${clean_flag} "; then
      bad_flags="${bad_flags} ${clean_flag}"
    fi
  done

  if [[ -n $bad_flags ]]; then
    ewarn "${HILITE}${rel_file}${NORMAL}: ${atom}: unknown USE flag(s):${bad_flags}"
    ISSUES=$((ISSUES + 1))
  fi

  # Check for redundant flags (enabling a flag that's already on by default)
  local defaults
  defaults=$(pkg_get_iuse_defaults "$catpkg")
  if [[ -n $defaults ]]; then
    local redundant_flags=""
    for flag in $flags; do
      # Only check positive flags (not negated with -)
      [[ "$flag" == -* ]] && continue
      if echo " $defaults " | grep -q " ${flag} "; then
        redundant_flags="${redundant_flags} ${flag}"
      fi
    done
    if [[ -n $redundant_flags ]]; then
      ewarn "${HILITE}${rel_file}${NORMAL}: ${atom}: redundant USE flag(s) (enabled by default):${redundant_flags}"
      ISSUES=$((ISSUES + 1))
    fi
  fi
}

check_mask_entry() {
  local rel_file="$1"
  local line="$2"

  local atom="$line"
  local catpkg
  catpkg=$(atom_to_catpkg "$atom") || return
  [[ -n $catpkg ]] || return

  if ! pkg_exists "$catpkg"; then
    ewarn "${HILITE}${rel_file}${NORMAL}: ${atom}: package not found in any repository"
    ISSUES=$((ISSUES + 1))
    return
  fi

  if [[ $atom == *-[0-9]* ]] && [[ $atom == [=\<\>~]* ]]; then
    if ! versioned_atom_exists "$atom"; then
      ewarn "${HILITE}${rel_file}${NORMAL}: ${atom}: version no longer exists"
      ISSUES=$((ISSUES + 1))
    fi
  fi
}

process_profile_type() {
  local path="$1"
  local check_func="$2"
  local overlay_root="$3"

  local files
  files=$(get_all_files "$path")
  [[ -n $files ]] || return

  while IFS= read -r file; do
    local rel_file="${file#"${overlay_root}"/}"
    while IFS= read -r entry; do
      "$check_func" "$rel_file" "$entry"
    done < <(read_entries "$file")
  done <<<"$files"
}

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
OVERLAY_ROOT=$(find_overlay_root "$SCRIPT_DIR") || {
  eerror "Could not find overlay root (no metadata/layout.conf found)"
  exit 2
}
PROFILES_DIR="${OVERLAY_ROOT}/profiles"

FILTER_PROFILE=""
CHECK_ALL_STABLE=false
while [[ $# -gt 0 ]]; do
  case "$1" in
  --profile)
    FILTER_PROFILE="$2"
    shift 2
    ;;
  --check-stable)
    CHECK_ALL_STABLE=true
    shift
    ;;
  --help | -h)
    echo "Usage: $0 [--profile <name>] [--check-stable]"
    echo "  --profile <name>  Only check profiles matching <name>"
    echo "  --check-stable    Report all keywords where a stable version exists"
    exit 0
    ;;
  *)
    eerror "Unknown option: $1"
    exit 2
    ;;
  esac
done

einfo "Checking profile entries in ${HILITE}${OVERLAY_ROOT}${NORMAL}"
einfo "Architecture: ${HILITE}${ARCH}${NORMAL}"
echo

while IFS= read -r profile_dir; do
  rel_profile="${profile_dir#"${PROFILES_DIR}"/}"

  has_pkg_files=false
  for ptype in package.accept_keywords package.use package.use.mask package.mask; do
    [[ -e "${profile_dir}/${ptype}" ]] && has_pkg_files=true && break
  done
  $has_pkg_files || continue

  if [[ -n $FILTER_PROFILE ]] && [[ $rel_profile != *"$FILTER_PROFILE"* ]]; then
    continue
  fi

  local_issues=$ISSUES
  einfo "Profile: ${HILITE}${rel_profile}${NORMAL}"
  eindent

  if [[ -e "${profile_dir}/package.accept_keywords" ]]; then
    process_profile_type "${profile_dir}/package.accept_keywords" check_keywords_entry "$OVERLAY_ROOT"
  fi

  if [[ -e "${profile_dir}/package.use" ]]; then
    process_profile_type "${profile_dir}/package.use" check_use_entry "$OVERLAY_ROOT"
  fi

  if [[ -e "${profile_dir}/package.use.mask" ]]; then
    process_profile_type "${profile_dir}/package.use.mask" check_use_entry "$OVERLAY_ROOT"
  fi

  if [[ -e "${profile_dir}/package.mask" ]]; then
    process_profile_type "${profile_dir}/package.mask" check_mask_entry "$OVERLAY_ROOT"
  fi

  if [[ $ISSUES -eq $local_issues ]]; then
    einfo "${GOOD}no issues${NORMAL}"
  fi

  eoutdent
done < <(find "$PROFILES_DIR" -name "eapi" -exec dirname {} \; | sort)

echo
if [[ $ISSUES -eq 0 ]]; then
  einfo "Result: ${GOOD}No issues found${NORMAL}"
  exit 0
else
  ewarn "Found ${HILITE}${ISSUES}${NORMAL} potential issue(s)"
  exit 1
fi
