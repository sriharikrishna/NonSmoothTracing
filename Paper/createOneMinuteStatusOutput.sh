#!/bin/sh
set -u
THISDIR=$PWD
cd Code/OneMinuteExample
openad -m t head.prepped.f90 > ${THISDIR}/OneMinuteStatusOutput.txt
cd ${THISDIR}
