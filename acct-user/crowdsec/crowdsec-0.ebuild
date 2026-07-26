# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="user for crowdsec"
KEYWORDS="amd64 arm64"
ACCT_USER_ID=399
ACCT_USER_GROUPS=( crowdsec )
ACCT_USER_HOME=/var/lib/crowdsec
ACCT_USER_HOME_OWNER=crowdsec:crowdsec
ACCT_USER_HOME_PERMS=0750

acct-user_add_deps
