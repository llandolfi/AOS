#!/bin/bash
rm output
rm $3
rm $2

#$1: time for each test
#output: latency output
#$3: events output

#TODO: start cyclictest only one time
START=$(date +%s) 
echo start time $START 
echo NO_load_start $START >> $3

#argument $1 time between load scripts triggering
cyclictest -t1 -p 77 -i 100 -n -l 0 -m -a 1 -v >> output &
echo cyclictest started without any load, sleeping for $1 seconds
echo ...

sleep $1


#count the number of lines in output
EVENT_START=$(date +%s)
EVENT_OFF=$((EVENT_START-START)) 
echo PING_load_start $EVENT_OFF >> $3

echo starting ping load 
echo ...

./pingload.sh > /dev/null 2> /dev/null

sleep $1
pkill -f ping

#count the number of lines at the end if ping load
echo terminating pingload

EVENT_START=$(date +%s)
EVENT_OFF=$((EVENT_START-START)) 
echo NO_load_start $EVENT_OFF >> $3


echo running with no load
echo ...

sleep $1


echo starting CPU load 
echo ...

EVENT_START=$(date +%s)
EVENT_OFF=$((EVENT_START-START)) 
echo CPU_load_start $EVENT_OFF >> $3
#echo $NUMLINES_B_CPU CPUload_start >> output

./CPUload.sh > /dev/null 2> /dev/null
sleep $1


pkill -f CPUload
rm bigfile

echo terminating cpu load

echo starting DU load 
echo ...

EVENT_START=$(date +%s)
EVENT_OFF=$((EVENT_START-START)) 
echo DU_load_start $EVENT_OFF >> $3
#echo $NUMLINES_B_CPU CPUload_start >> output

./duload.sh > /dev/null 2> /dev/null
sleep $1


pkill -f duload

echo terminating DU load

echo starting I/O load
echo ... 

EVENT_START=$(date +%s)
EVENT_OFF=$((EVENT_START-START)) 
echo IO_load_start $EVENT_OFF >> $3
#echo $NUMLINES_B_IO IOload_start >> output

./ioload.sh > /dev/null 2> /dev/null

sleep $1


pkill -f ioload
pkill -f gzip
rm *.tgz

echo terminating IO load

echo starting Network load
echo ...

EVENT_START=$(date +%s)
EVENT_OFF=$((EVENT_START-START)) 
echo NETWORK_load_start $EVENT_OFF >> $3
#echo $NUMLINES_B_IO NETload_start >> output

source ./networkload.sh > /dev/null 2> /dev/null
sleep $1


pkill -f networkload
pkill -f nc

echo terminating NET load

'''
echo starting Fork load
echo ... 

EVENT_START=$(date +%s)
EVENT_OFF=$((EVENT_START-START)) 
echo FORK_load_start $EVENT_OFF>> $3
#echo $NUMLINES_B_IO IOload_start >> output

echo launching forkload
./forkload > /dev/null 2> /dev/null
echo forkload launched
#sleep $(($1*2))
echo sleeping for $1 seconds
sleep $1

echo killing forks
for VARAIBLE in 1 2 3
do
	pkill -f forkload
done
'''echo forks killed

pkill -f cyclictest


echo creating plot file
sleep 1
grep -v '^[Max\Thread\#\]' output > $2 

#cp $2 $2.tmp
#sed '$ d' $2.tmp > $2
#rm -f $2.tmp