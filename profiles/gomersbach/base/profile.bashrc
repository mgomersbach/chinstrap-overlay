local CORES="$(grep -c ^proc /proc/cpuinfo)"
echo ${MAKEOPTS} | grep -q -e -j || export MAKEOPTS="--jobs --load=${CORES}"
