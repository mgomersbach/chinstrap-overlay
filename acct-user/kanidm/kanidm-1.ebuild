# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="A user for kanidm"
KEYWORDS="amd64 arm64"
ACCT_USER_ID=-1
ACCT_USER_HOME=/var/lib/kanidm
ACCT_USER_HOME_PERMS=0750
ACCT_USER_GROUPS=( kanidm )

acct-user_add_deps
