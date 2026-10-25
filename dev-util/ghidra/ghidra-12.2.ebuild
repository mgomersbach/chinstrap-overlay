# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..14} )
inherit java-pkg-2 desktop python-single-r1

GRADLE_DEP_VER="20261025"
# Ghidra/application.properties
GRADLE_VER="9.1"

# ./gradle/support/fetchDependencies.gradle
# ghidra-data tag for FIDB / sarif / dbgmodel assets; identical content since
# Ghidra_11.4, so tracking PV costs no refetch.
RELEASE_VERSION="${PV}"

DESCRIPTION="A software reverse engineering framework"
HOMEPAGE="https://github.com/NationalSecurityAgency/ghidra"

# ./gradle/support/fetchDependencies.gradle
FIDB_FILES="vs2012_x86.fidb vs2012_x64.fidb vs2015_x86.fidb vs2015_x64.fidb \
vs2017_x86.fidb vs2017_x64.fidb vs2019_x86.fidb vs2019_x64.fidb vsOlder_x86.fidb vsOlder_x64.fidb"

Z3_VER="4.13.0"
Z3_X64_GLIBC_VER="2.31"
Z3_NAME="z3-${Z3_VER}-x64-glibc-${Z3_X64_GLIBC_VER}"

SRC_URI="https://github.com/NationalSecurityAgency/${PN}/archive/refs/tags/Ghidra_${PV}_build.tar.gz
	https://dev.pentoo.ch/~blshkv/distfiles/${PN}-dependencies-${GRADLE_DEP_VER}.tar.gz
	https://github.com/pxb1988/dex2jar/releases/download/v2.4/dex-tools-v2.4.zip
	https://github.com/NationalSecurityAgency/ghidra-data/raw/Ghidra_${RELEASE_VERSION}/Debugger/dbgmodel.tlb
	https://github.com/digitalsleuth/AXMLPrinter2/raw/691036a3caf84950fbb0df6f1fa98d7eaa92f2a0/AXMLPrinter2.jar
	https://github.com/unsound/hfsexplorer/releases/download/hfsexplorer-0.21/hfsexplorer-0_21-bin.zip
	https://downloads.sourceforge.net/yajsw/yajsw/yajsw-stable-13.18.zip
	https://ftp.postgresql.org/pub/source/v15.18/postgresql-15.18.tar.gz
	https://archive.eclipse.org/tools/cdt/releases/8.6/cdt-8.6.0.zip
	https://sourceforge.net/projects/pydev/files/pydev/PyDev%209.3.0/PyDev%209.3.0.zip -> PyDev-9.3.0.zip
	https://github.com/NationalSecurityAgency/ghidra-data/raw/Ghidra_${RELEASE_VERSION}/lib/java-sarif-2.1-modified.jar
	https://github.com/Z3Prover/z3/releases/download/z3-${Z3_VER}/${Z3_NAME}.zip
"
for FIDB in ${FIDB_FILES}; do
	SRC_URI+=" https://github.com/NationalSecurityAgency/ghidra-data/raw/Ghidra_${RELEASE_VERSION}/FunctionID/${FIDB}"
done

	SRC_URI+=" https://files.pythonhosted.org/packages/ee/01/1ed1d482960a5718fd99c82f6d79120181947cfd4667ec3944d448ed44a3/protobuf-6.31.0-py3-none-any.whl
	https://files.pythonhosted.org/packages/90/c7/6dc0a455d111f68ee43f27793971cf03fe29b6ef972042549db29eec39a2/psutil-5.9.8.tar.gz
	https://files.pythonhosted.org/packages/a3/dc/17031897dae0efacfea57dfd3a82fdd2a2aeb58e0ff71b77b87e44edc772/setuptools-80.9.0-py3-none-any.whl
	https://files.pythonhosted.org/packages/0b/2c/87f3254fd8ffd29e4c02732eee68a83a1d3c346ae39bc6822dcbcb697f2b/wheel-0.45.1-py3-none-any.whl
	https://files.pythonhosted.org/packages/5e/a2/52084698c0a3c7e7a94ddfff26f83df09a50781b8436f6f203f5de0a457c/pybag-2.2.16-py3-none-any.whl
	https://files.pythonhosted.org/packages/da/72/ff7894c2fb5716d9a3ce9c27ba34b29d991a11d8442d2ef0fcdc5564ba7e/capstone-5.0.6-py3-none-win_amd64.whl
	https://files.pythonhosted.org/packages/66/95/f30c80615fda0d3c0ee6493ac9db61183313b43499b62dec136773b0e870/comtypes-1.4.13-py3-none-any.whl
	https://files.pythonhosted.org/packages/5e/bf/360243b1e953bd254a82f12653974be395ba880e7ec23e3731d9f73921cc/pywin32-311-cp310-cp310-win_amd64.whl
	https://files.pythonhosted.org/packages/51/8f/9bb81dd5bb77d22243d33c8397f09377056d5c687aa6d4042bea7fbf8364/pywin32-311-cp311-cp311-win_amd64.whl
	https://files.pythonhosted.org/packages/d1/a8/a0e8d07d4d051ec7502cd58b291ec98dcc0c3fff027caad0470b72cfcc2f/pywin32-311-cp312-cp312-win_amd64.whl
	https://files.pythonhosted.org/packages/e3/28/e0a1909523c6890208295a29e05c2adb2126364e289826c0a8bc7297bd5c/pywin32-311-cp313-cp313-win_amd64.whl
	https://files.pythonhosted.org/packages/90/4b/07c77d8ba0e01349358082713400435347df8426208171ce297da32c313d/pywin32-311-cp314-cp314-win_amd64.whl"

S="${WORKDIR}/ghidra-Ghidra_${PV}_build"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Ghidra/application.properties: application.java.compiler=25
JAVA_PKG_WANT_SOURCE="25"
JAVA_PKG_WANT_TARGET="25"

REQUIRED_USE=${PYTHON_REQUIRED_USE}
RDEPEND="virtual/jre:25
		${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	virtual/jdk:25
	sys-devel/bison
	dev-java/jflex
	app-arch/unzip"
BDEPEND=">=dev-java/gradle-bin-${GRADLE_VER}:*
		dev-python/pip"

check_gradle_binary() {
	gradle_link_target=$(readlink -n /usr/bin/gradle)
	currentver="${gradle_link_target/gradle-bin-/}"
	requiredver="${GRADLE_VER}"
	einfo "Gradle version ${currentver} currently set."
	if [ "$(printf '%s\n' "$requiredver" "$currentver" | sort -V | head -n1)" = "$requiredver" ]; then
		einfo "Gradle version ${currentver} is >= ${requiredver}, proceeding with build..."
	else
		eerror "Gradle version ${requiredver} or higher must be eselected before building ${PN}."
		die "Please run 'eselect gradle set gradle-bin-XX' when XX is a version of gradle >= ${requiredver}"
	fi
}

pkg_setup() {
	java-pkg-2_pkg_setup
	python-single-r1_pkg_setup
}

src_unpack() {
	unpack ${A}
	mkdir -p "${S}/.gradle/flatRepo" || die "(1) mkdir failed"
	cd "${S}/.gradle"

	unpack dex-tools-v2.4.zip
	cp dex-tools-v2.4/lib/dex-*.jar ./flatRepo || die "(2) cp failed"

	cp "${DISTDIR}/AXMLPrinter2.jar" ./flatRepo  || die "(3) cp failed"
	cp "${DISTDIR}/java-sarif-2.1-modified.jar" ./flatRepo  || die "(4) cp failed"

	unpack hfsexplorer-0_21-bin.zip
	cp lib/*.jar ./flatRepo            || die "(5) cp failed"

	mkdir -p "${WORKDIR}"/ghidra.bin/Ghidra/Features/GhidraServer/ || die "(6) mkdir failed"
	cp "${DISTDIR}"/yajsw-stable-13.18.zip "${WORKDIR}"/ghidra.bin/Ghidra/Features/GhidraServer/ || die "(7) cp failed"

	PLUGIN_DEP_PATH="ghidra.bin/GhidraBuild/EclipsePlugins/GhidraDev/buildDependencies"
	mkdir -p "${WORKDIR}/${PLUGIN_DEP_PATH}/" || die "(8) mkdir failed"
	cp "${DISTDIR}"/PyDev-9.3.0.zip "${WORKDIR}/${PLUGIN_DEP_PATH}/PyDev 9.3.0.zip" || die "(9) cp failed"
	cp "${DISTDIR}"/cdt-8.6.0.zip   "${WORKDIR}/${PLUGIN_DEP_PATH}/" || die "(10) cp failed"
	cp "${DISTDIR}"/postgresql-15.18.tar.gz   "${WORKDIR}/${PLUGIN_DEP_PATH}/" || die "(10) cp failed"

	unpack ${Z3_NAME}.zip
	mkdir -p ./dependencies/SymbolicSummaryZ3/os/linux_x86_64
	cp ${Z3_NAME}/bin/libz3*.so ./dependencies/SymbolicSummaryZ3/os/linux_x86_64 || die "(11) cp failed"
	cp ${Z3_NAME}/bin/*.jar ./flatRepo || die "(12) cp failed"

	cd "${S}"
	mv ../dependencies .

	mkdir ./dependencies/fidb || die "failed to create fidb dir"
	for FIDB in ${FIDB_FILES}; do
		cp "${DISTDIR}/${FIDB}" ./dependencies/fidb/ || die
	done

	mkdir -p ./dependencies/{Debugger-rmi-trace,Debugger-agent-dbgeng} || die "failed to create Debugger dir"
	cp "${DISTDIR}"/protobuf-6.31.0-py3-none-any.whl ./dependencies/Debugger-rmi-trace/ || die
	cp "${DISTDIR}"/psutil-5.9.8.tar.gz ./dependencies/Debugger-rmi-trace/ || die
	cp "${DISTDIR}"/setuptools-80.9.0-py3-none-any.whl ./dependencies/Debugger-rmi-trace/ || die
	cp "${DISTDIR}"/wheel-0.45.1-py3-none-any.whl ./dependencies/Debugger-rmi-trace/ || die

	cp "${DISTDIR}"/pybag-2.2.16-py3-none-any.whl ./dependencies/Debugger-agent-dbgeng/ || die
	cp "${DISTDIR}"/capstone-5.0.6-py3-none-win_amd64.whl ./dependencies/Debugger-agent-dbgeng/ || die
	cp "${DISTDIR}"/comtypes-1.4.13-py3-none-any.whl ./dependencies/Debugger-agent-dbgeng/ || die
	local pyver
	for pyver in 310 311 312 313 314; do
		cp "${DISTDIR}"/pywin32-311-cp${pyver}-cp${pyver}-win_amd64.whl ./dependencies/Debugger-agent-dbgeng/ || die
	done

	cp "${DISTDIR}"/dbgmodel.tlb ./dependencies/Debugger-agent-dbgeng/ || die
}

src_prepare() {
	mkdir -p ".gradle/init.d"                       || die "(10) mkdir failed"
	cp "${FILESDIR}"/repos.gradle .gradle/init.d    || die "(11) cp failed"
	sed -i "s|S_DIR|${S}|g" .gradle/init.d/repos.gradle || die "(12) sed failed"
	# Strip the date suffix so build/dist/ paths are predictable for src_install.
	sed -i "s|_\${rootProject.BUILD_DATE_SHORT}||g" gradle/root/distribution.gradle || die "(13) sed failed"
	# 10.0 workaround
	ln -s ../.gradle/flatRepo ./dependencies/flatRepo

	sed -i "s/findPython3(true)/\"${EPYTHON}\"/" build.gradle || die

	eapply_user
}

src_compile() {
	check_gradle_binary
	export _JAVA_OPTIONS="$_JAVA_OPTIONS -Duser.home=$HOME -Djava.io.tmpdir=${T}"

	GRADLE="gradle --gradle-user-home .gradle --console rich --no-daemon"
	GRADLE="${GRADLE} --offline --parallel --max-workers $(nproc)"
	unset TERM
	${GRADLE} prepDev -x check -x test || die
	${GRADLE} assembleAll -x check -x test --parallel || die
}

src_install() {
	# remove zip files which aren't needed at runtime
	find build/dist/ghidra_${PV}_DEV/ -type f -name '*.zip' -exec rm -f {} +
	rm -r  build/dist/ghidra_${PV}_DEV/docs/ || die "rm failed"

	insinto /usr/share/ghidra
	doins -r build/dist/ghidra_${PV}_DEV/*
	fperms +x /usr/share/ghidra/ghidraRun
	fperms +x /usr/share/ghidra/support/launch.sh
	fperms +x /usr/share/ghidra/GPL/DemanglerGnu/os/linux_x86_64/demangler_gnu_v2_41
	fperms +x /usr/share/ghidra/Ghidra/Features/Decompiler/os/linux_x86_64/decompile

	shopt -s nullglob
	pushd "${ED}" >/dev/null
	fperms +x usr/share/ghidra/Ghidra/Debug/Debugger-*/data/{debugger-launchers,support}/*.sh
	popd >/dev/null
	shopt -u nullglob

	dosym -r /usr/share/ghidra/ghidraRun /usr/bin/ghidra

	doicon GhidraDocs/GhidraClass/Beginner/Images/GhidraLogo64.png
	make_desktop_entry ${PN} "Ghidra" /usr/share/pixmaps/GhidraLogo64.png "Utility"
}
