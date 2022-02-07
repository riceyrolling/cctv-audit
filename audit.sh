#!/bin/bash
# https://stackoverflow.com/questions/10768160/ip-address-converter

dec2ip() {
    declare -i a=$((\~(-1<<8))) b=$1;
    set -- "$((b>>24&a))" "$((b>>16&a))" "$((b>>8&a))" "$((b&a))";
    local IFS=.;
    echo "$\*";
}

ip2dec() {
    declare -i a b c d;
    IFS=. read a b c d <<<"$1";
    echo "$(((a<<24)+(b<<16)+(c<<8)+d))";
}

if [ "$#" -lt 3 ]; then
    echo "Usage: audit.sh [start ip] [end ip] [user] [pass]"
    exit
fi

FRST=$1
LAST=$2
CUSER=$3
CPASS=$4

for ip in $(seq $(ip2dec $FRST) $(ip2dec $LAST)); do
    node download.js $ip $CUSER $CPASS
done