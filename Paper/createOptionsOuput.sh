#!/bin/sh
set -u
THISDIR=$PWD
cd ${OPENADROOT}/xaifBooster/algorithms/TraceDiff/test 
./t -h | grep -v "caught exception" | grep -v "=== reset log" | grep -v "xaifBooster/algorithms/TraceDiff/test" >  ${THISDIR}/tracingAlgOpts.txt
cd ${THISDIR}
