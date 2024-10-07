
#!/bin/bash

. /root/shell/functions2.sh

PasswdFile=/root/shell/passwd
TMP1=/tmp/tmp1
TMP2=/tmp/tmp2
Result=/root/shell/report.txt
> $Result

cat << EOF >> $Result

[U-1] root 이외의 UID가 '0' 금지
=======================================================
1. 판단 근거
[ 양호 ] root 이외의 UID가 '0' 없는 경우
[ 취약 ] root 이외의 UID가 '0' 존재하는 경우
=======================================================
EOF

echo "2. 점검 결과" >> $Result
awk -F: '$3 == 0 {print $1 "\t\t : UID = " $3 }' $PasswdFile > $TMP1
cat $TMP1 | grep -v '^root' > $TMP2
if [ -s $TMP2 ] ; then
        WARN "root 이외의 UID가 '0'인 사용자가 존재합니다." >> $Result
else
        OK "root 이외의 UID가 '0'인 사용자가 존재하지 않습니다." >> $Result
fi
echo "=======================================================" >> $Result

echo "3. 참고 내용" >> $Result
cat $TMP1 >> $Result
echo "=======================================================" >> $Result
echo >> $Result

cat $Result