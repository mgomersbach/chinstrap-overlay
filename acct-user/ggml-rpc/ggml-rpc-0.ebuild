# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for ggml-rpc-server"
KEYWORDS="amd64 arm64"
ACCT_USER_ID=109
ACCT_USER_HOME=/var/lib/ggml-rpc-server
ACCT_USER_HOME_OWNER=ggml-rpc:ggml-rpc
ACCT_USER_GROUPS=( ggml-rpc video render )

acct-user_add_deps
