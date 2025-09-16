#!/bin/bash

cd /Users/mac/Desktop/DE2025/btc/

COUNTER_FILE=".commit_counter"

if [ ! -f $COUNTER_FILE ]; then
    echo 0 > $COUNTER_FILE
fi

count=$(cat $COUNTER_FILE)
((count++))
echo $count > $COUNTER_FILE

git add .
git commit -m "Auto-commit #${count}"
