#!/bin/bash

# get all the other arguments passed to this script so that they can be passed to rm

ARGS=("$@")

while read -r FILE; do
    rm "$FILE" "${ARGS[@]}" && echo "$FILE"
done
