#!/bin/bash

while read -r FILE; do
    rm "$FILE"

    echo "$FILE"
done
