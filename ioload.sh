#!/bin/bash
while true; do taskset -c 0 tar cvzf test1.tgz  ./linux-stable ; done  &
while true; do taskset -c 1 tar cvzf test2.tgz  ./linux-stable ; done  &
while true; do taskset -c 2 tar cvzf test3.tgz  ./linux-stable ; done  &
while true; do taskset -c 3 tar cvzf test4.tgz  ./linux-stable ; done  &
while true; do taskset -c 4 tar cvzf test5.tgz  ./linux-stable ; done  &
while true; do taskset -c 5 tar cvzf test6.tgz  ./linux-stable ; done  &
while true; do taskset -c 6 tar cvzf test7.tgz  ./linux-stable ; done  &
while true; do taskset -c 7 tar cvzf test8.tgz  ./linux-stable ; done  &
while true; do taskset -c 8 tar cvzf test9.tgz  ./linux-stable ; done  &
while true; do taskset -c 9 tar cvzf test10.tgz  ./linux-stable ; done  &
while true; do taskset -c 10 tar cvzf test11.tgz  ./linux-stable ; done  &
while true; do taskset -c 11 tar cvzf test12.tgz  ./linux-stable ; done  &