#!/bin/bash
starttime=$(date +%s)

mountpoint=/BIGDATA/workloads/dataset
file=$mountpoint/data_1000.txt
dir=$mountpoint/result
mkdir $dir

cat $file | while read line
do
    echo "1" >> "$dir"/"$line".txt
done
max=0
file_count=0
for filename in `ls $dir`
do
    cur_line=`wc -l $dir/$filename | awk '{print $1}'`
    if [ "$cur_line" -gt "$max" ]
    then
        max=$cur_line
        max_str=$filename
    fi
    file_count=`expr $file_count + 1`
done

echo "total file : $file_count"
echo "max num string : ${max_str%.txt}"

endtime=$(date +%s)
cost=$((endtime - starttime))
echo "cost $cost sec"
