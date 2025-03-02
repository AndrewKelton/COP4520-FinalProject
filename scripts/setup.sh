#!/bin/bash

# Directories for output testing
BUILD_TEST_DIR="./build"
BASE_TEST_DIR="./test-output"
COMP_TEST_DIR="./comparison"
SOLO_TEST_DIR="./solo"
RES_TEST_DIR="./results"
LOG_TEST_DIR="./logs"

# Correct array definition (no commas)
ALL_TEST_DIRS=("$BASE_TEST_DIR" "$COMP_TEST_DIR" "$RES_TEST_DIR" "$LOG_TEST_DIR" "$SOLO_TEST_DIR" "$RES_TEST_DIR" "$LOG_TEST_DIR")

echo "Setting up testing directories..."

mkdir -p "$BUILD_TEST_DIR" 

# Check/Create directory for each 
# required directory for testing 
for DIR in "${ALL_TEST_DIRS[@]}"; do

    if [ ! -d "$DIR" ]; then
        echo "Creating directory: $DIR"
        mkdir -p "$DIR"
    fi

    if [ "$DIR" == "$LOG_TEST_DIR" ]; then
        cd ".."  
    elif [ "$DIR" != "$RES_TEST_DIR" ]; then
        cd "$DIR" 
    fi

done
