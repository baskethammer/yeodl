#!/bin/bash
#################################################
# depends on yeodl.config for globals:
# YEODLDIR
#
#################################################
set -euo pipefail
IFS=$'\n\t'

#: ${XDG_CONFIG_HOME}:=$HOME/.config

if [ -z "${XDG_CONFIG_HOME:-}" ]; then
    XDG_CONFIG_HOME=$HOME/.config
fi

mkdir -p ${XDG_CONFIG_HOME}/yeodl
cp ./yeodl.config ${XDG_CONFIG_HOME}/yeodl

. ${XDG_CONFIG_HOME}/yeodl/yeodl.config

mkdir -p ${YEODLDIR}/{bin,dbs,exchanges,lib,src}
mkdir -p ${YEODLDIR}/exchanges/{US,INDX,COMM}/{prices,symbols}
mkdir -p ${YEODLDIR}/exchanges/US/{dividends,earnings,fundamentals,options,splits}
mkdir -p ${YEODLDIR}/exchanges/US/prices/byticker
mkdir -p ${YEODLDIR}/dbs/schemas


#todo when installing to new location, copy libdir and bin dir from this one, along with schemas
