#!/bin/sh
set -u
THISDIR=$PWD
cd Code/OneMinuteExample
openad -m t head.prepped.f90 > ${THISDIR}/oneMinuteStatusOutput.txt
tail +53 head.prepped.xb.x2w.w2f.pp.f > h1.tmp
mv h1.tmp head.prepped.xb.x2w.w2f.pp.f
export F90C=gfortran
make driver
./driver
cd ${THISDIR}
