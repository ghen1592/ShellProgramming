DATE=$(date +'%Y.%m.%d %H:%M')
OS=$(cat /etc/redhat-release)
KERNEL=$(uname -sr)
CPUNum=$(lscpu | grep '^CPU(s):' | awk '{print $2}')
CPUType=$(echo $(lscpu | grep 'Model name:' | awk -F: '{print $2}'))
MEM=$(free | grep Mem: | awk '{print $2}')k
DISKNum=$(lsblk -S | awk '$3 == "disk" {print $0}' | wc -l)

AnswerName () {
echo
echo "---------- Scripter Infomation ---------"
while true
do
	echo -n "Enter your name? : "
	read NAME
	echo 
	echo "Your name is : $NAME"
	echo -n "Is correct?(y/n) : "
	read Choice
	case $Choice in
		y|Y|yes|Yes) break ;;
		*) contine ;;
	esac
done
}