#!/bin/bash

dir=`dirname $0`
source_file="$dir/users_list.txt"

iter_num=1
for user_data in $(cat "$source_file"); do
login=$(echo "$user_data" | awk -F ',' {'print $1'})

echo "Delete user with login: $login..."

#  commands
#if [ ??? ];then
#make backup of user home
#tar
#fi
deluser --remove-home "$login" &>>/dev/null

if [ $? -ne 0 ];then
echo "error: user does not exist"
else
echo "done."
fi
echo ""
[ $iter_num -eq 3 ] && exit 8 #FIXME

iter_num=$(($iter_num+1))
done

