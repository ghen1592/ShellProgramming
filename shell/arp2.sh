---------------------------------------------------
#!/bin/bash

NET=172.16.6.
START=200
END=230

while [ $START -le $END ]
do
        ping -c 1 ${NET}${START} >/dev/null 2>&1
        if [ $? -eq 0 ] ; then
                echo "${NET}${START}    : alive"
        else
                echo "${NET}${START}    : dead"
        fi
        START=`expr $START + 1`
done

echo "=========== ARP Caching Table =============="
arp -an | grep $NET
echo ; echo
---------------------------------------------------