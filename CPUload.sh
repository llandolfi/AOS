#!/bin/sh
# Most hardcore test (Ingo Molnar - http://lkml.org/lkml/2005/6/22/347)
# For Heavy CPU Ratio.
while true; do dd if=/dev/zero of=bigfile bs=1024000 count=1024; done &
while true; do killall hackbench; sleep 5; done &
while true; do hackbench 20; done &
while true; do dd if=/dev/zero of=bigfile bs=1024000 count=1024; done &
while true; do killall hackbench; sleep 5; done &
while true; do hackbench 20; done &
while true; do dd if=/dev/zero of=bigfile bs=1024000 count=1024; done &
while true; do killall hackbench; sleep 5; done &
while true; do hackbench 20; done &
# some source code(ltp-full-20090531) consists of sched_setschduler() with FIFO 99.
#cd ltp-full-20090531; while true; do ./runalltests.sh -x 40; done  &
