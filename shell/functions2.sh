function OK () {
    echo -e "\x1B[01;32m[ 양호 ]\x1B[0m $*"
}

function WARN () {
    echo -e "\x1B[01;31m[ 취약 ]\x1B[0m $*"
}
