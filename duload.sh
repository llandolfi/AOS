#!/bin/bash
while true; do taskset -c 0 du / ; done  &
while true; do taskset -c 1 du / ; done  &
while true; do taskset -c 2 du / ; done  &
while true; do taskset -c 3 du / ; done  &
while true; do taskset -c 4 du / ; done  &
while true; do taskset -c 5 du / ; done  &
while true; do taskset -c 6 du / ; done  &
while true; do taskset -c 7 du / ; done  &
while true; do taskset -c 8 du / ; done  &
while true; do taskset -c 9 du / ; done  &
while true; do taskset -c 10 du / ; done  &
while true; do taskset -c 11 du / ; done  &