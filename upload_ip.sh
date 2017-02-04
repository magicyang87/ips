#!/bin/sh
set -x

this_dir=`pwd` 
dirname $0|grep "^/" >/dev/null 
if [ $? -eq 0 ];then 
this_dir=`dirname $0` 
else 
dirname $0|grep "^\." >/dev/null 
retval=$? 
if [ $retval -eq 0 ];then 
this_dir=`dirname $0|sed "s#^.#$this_dir#"` 
else 
this_dir=`dirname $0|sed "s#^#$this_dir/#"` 
fi 
fi 
echo $this_dir 

cd $this_dir;
git pull;
/sbin/ifconfig > ip;
git commit -a -m 'update current dldev ip';
git push;
