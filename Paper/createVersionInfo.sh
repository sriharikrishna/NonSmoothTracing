#!/bin/sh
hg tip > /dev/null
if [ $? -ne 0 ] 
then 
  echo "hg: n/a by $USER" > versionInfo.txt.new
else
  echo -n "$(hg tip | grep changeset: | sed 's/changeset:[ ]*\(.*\):\(.*\)/hg:\1/'):$(hg id | sed 's/\([^ ].*\) \(.*\)/\1/')" > versionInfo.txt.new
  echo " by $(echo $USER | sed 's/_/\\_/')" >> versionInfo.txt.new  
fi
diff versionInfo.txt.new versionInfo.txt > /dev/null
if [ $? -ne 0 ]
then 
  mv versionInfo.txt.new versionInfo.txt
else 
  rm  versionInfo.txt.new
fi

cd ../../Rapsodia
hg tip > /dev/null
if [ $? -ne 0 ] 
then 
  echo "hg: n/a by $USER" > ../Rapsodia_Manual/Manual/versionInfoR.txt.new
else
  echo -n "$(hg tip | grep changeset: | sed 's/changeset:[ ]*\(.*\):\(.*\)/hg:\1/'):$(hg id | sed 's/\([^ ].*\) \(.*\)/\1/')" > ../Rapsodia_Manual/Manual/versionInfoR.txt.new
  echo " by $(echo $USER | sed 's/_/\\_/')" >> ../Rapsodia_Manual/Manual/versionInfoR.txt.new  
fi
cd ../Rapsodia_Manual/Manual
diff versionInfoR.txt.new versionInfoR.txt > /dev/null
if [ $? -ne 0 ]
then 
  mv versionInfoR.txt.new versionInfoR.txt
else 
  rm  versionInfoR.txt.new
fi