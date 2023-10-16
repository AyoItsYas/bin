#!/bin/bash

ARGS=("$@")

TOTAL_COUNT=0
TOTAL_OLD_SIZE=0
TOTAL_NEW_SIZE=0

START_TIME=$(date +%s)

while read -r FILE; do
    magick convert "$FILE" "${FILE%.*}.heic" "${ARGS[@]}"

    TOTAL_COUNT=$((TOTAL_COUNT + 1))
    TOTAL_OLD_SIZE=$((TOTAL_OLD_SIZE + $(stat -c%s "$FILE")))
    TOTAL_NEW_SIZE=$((TOTAL_NEW_SIZE + $(stat -c%s "${FILE%.*}.heic")))

    echo "$FILE"
done

END_TIME=$(date +%s)

EXECUTION_TIME=$((END_TIME - START_TIME))

if [ $TOTAL_COUNT -eq 0 ]; then
    exit 0
fi

echo "Batch HEIC Encoder" >> log.txt
echo "  Total files converted      : $TOTAL_COUNT" >> log.txt
echo "  Total size before encoding : $((TOTAL_OLD_SIZE / 1024 / 1024)) MB" >> log.txt
echo "  Total size after encoding  : $((TOTAL_NEW_SIZE / 1024 / 1024)) MB" >> log.txt
echo "  Total size difference      : $(((TOTAL_OLD_SIZE - TOTAL_NEW_SIZE) / 1024 / 1024)) MB" >> log.txt
printf "  Execution time             : %02d:%02d:%02d\n" "$((EXECUTION_TIME / 3600))" "$((EXECUTION_TIME % 3600 / 60))" "$((EXECUTION_TIME % 60))" >> log.txt
echo "  Time per file              : $((EXECUTION_TIME / TOTAL_COUNT)) seconds" >> log.txt
echo "  Time per MB                : $((EXECUTION_TIME / (TOTAL_NEW_SIZE / 1024 / 1024))) seconds" >> log.txt
