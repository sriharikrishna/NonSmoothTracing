#!/bin/sh
hg tip > /dev/null
if [ $? -ne 0 ] 
then 
  echo "hg: n/a by $USER" > versionInfo.txt.new
else
  echo -n "$(hg tip | grep changeset: | sed 's/changeset:[ ]*\(.*\):\(.*\)/hg:\1/'):$(hg id | sed 's/\([^ ].*\) \(.*\)/\1/')" > versionInfo.txt.new
fi
diff versionInfo.txt.new versionInfo.txt > /dev/null
if [ $? -ne 0 ]
then 
  mv versionInfo.txt.new versionInfo.txt
else 
  rm  versionInfo.txt.new
fi

THISDIR=$PWD
cd $OPENADROOT
hg tip > /dev/null
if [ $? -ne 0 ] 
then 
  echo "hg: n/a by $USER" > $THISDIR/versionInfoOpenAD.txt.new
else
  echo -n "$(hg tip | grep changeset: | sed 's/changeset:[ ]*\(.*\):\(.*\)/hg:\1/'):$(hg id | sed 's/\([^ ].*\) \(.*\)/\1/')" > $THISDIR/versionInfoOpenAD.txt.new
fi
cd $THISDIR
diff versionInfoOpenAD.txt.new versionInfoOpenAD.txt > /dev/null
if [ $? -ne 0 ]
then 
  mv versionInfoOpenAD.txt.new versionInfoOpenAD.txt
else 
  rm  versionInfoOpenAD.txt.new
fi

cd $OPENADROOT/xaifBooster
hg tip > /dev/null
if [ $? -ne 0 ] 
then 
  echo "hg: n/a by $USER" > $THISDIR/versionInfoxaifBooster.txt.new
else
  echo -n "$(hg tip | grep changeset: | sed 's/changeset:[ ]*\(.*\):\(.*\)/hg:\1/'):$(hg id | sed 's/\([^ ].*\) \(.*\)/\1/')" > $THISDIR/versionInfoxaifBooster.txt.new
fi
cd $THISDIR
diff versionInfoxaifBooster.txt.new versionInfoxaifBooster.txt > /dev/null
if [ $? -ne 0 ]
then 
  mv versionInfoxaifBooster.txt.new versionInfoxaifBooster.txt
else 
  rm  versionInfoxaifBooster.txt.new
fi

cd $THISDIR