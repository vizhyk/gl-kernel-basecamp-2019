!#/bin/bash
home_path=/home/vvi/Ker_Modules/chtest/
proc_file_path=/proc/chtest
dev_file_path=/dev/chtest
sys_file_path=/sys/kernel/chtestflag/clrflag
test_file_path=/home/vvi/Ker_Modules/chtest/
mod_name=chtest.ko
test_name=testread_dev

echo "Loading modul"
insmod $home_path$mod_name 
echo "checking module status"
cat $proc_file_path
echo "writing to device"
echo  "0123456789" > $dev_file_path
echo "checking module status"
cat $proc_file_path
echo "clearing a buffer"
echo 1 >$sys_file_path
echo "checking module status"
cat $proc_file_path
echo "writing to device\n"
echo  "0123456789" > $dev_file_path
echo "checking module status"
cat $proc_file_path
echo "reading data from device"
$test_file_path$test_name
echo "unlodading buffer"
rmmod $mod_name







