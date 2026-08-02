# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for the llama-swap daemon"
ACCT_USER_ID=-1
ACCT_USER_HOME=/var/lib/llama-swap
ACCT_USER_HOME_PERMS=0700
ACCT_USER_GROUPS=( llama-swap )

acct-user_add_deps
