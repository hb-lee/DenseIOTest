#!/bin/bash
for i in {1..100000}
do
    echo $((RANDOM % 1000)) >> data.txt
done
