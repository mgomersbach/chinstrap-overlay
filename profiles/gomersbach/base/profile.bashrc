#!/bin/bash
	#local CORES="$(grep -c ^proc /proc/cpuinfo)"
	#export MAKEOPTS="--jobs --load=${CORES}"
	#export LANG=C
	#export EMERGE_DEFAULT_OPTS="${EMERGE_DEFAULT_OPTS} --jobs --load-average=${CORES}"
DEBUG="TRUE"

# get physical cpus from lscpu
SOCKETS="$(lscpu | grep Socket\(s\): | awk '{print $2}' )"

# get cores per socket from lscpu
CORES="$(lscpu | grep Core\(s\)\ \per\ \socket: | awk '{print $4}')"

# multiply sockets * cores +1
REAL_CORES="$((${SOCKETS}*${CORES}+1))"

export MAKEOPTS="--jobs="${REAL_CORES}" --silent --load-average="${REAL_CORES}" "

if [[ ${DEBUG} = "TRUE" ]]; then
	echo SOCKETS=${SOCKETS}
	echo CORES=${CORES}
	echo REAL_CORES=${REAL_CORES}
	echo MAKEOPTS=${MAKEOPTS}
fi 