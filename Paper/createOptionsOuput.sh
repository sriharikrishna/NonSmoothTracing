#!/bin/sh
set -u
THISDIR=$PWD
cd ${OPENADROOT}/xaifBooster/algorithms/TraceDiff/driver 
./oadDriver | grep -v "caught exception" | grep -v "=== reset log" | grep -v "xaifBooster/algorithms/TraceDiff/driver" >  ${THISDIR}/tracingAlgOpts.txt
cd ${THISDIR}
