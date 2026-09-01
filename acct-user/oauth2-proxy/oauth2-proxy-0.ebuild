# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for oauth2-proxy"
KEYWORDS="amd64 arm64"
ACCT_USER_ID=111
ACCT_USER_GROUPS=( oauth2-proxy )

acct-user_add_deps
