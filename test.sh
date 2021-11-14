#!/bin/bash

CORE='\033['
RED=${CORE}'0;31m'
GREEN=${CORE}'0;32m'
CLEAR=${CORE}'0m'
BLUE=${CORE}'0;34m'

# Linking task solutions

if [ ! -f fuzzy.h ]; then
    ln -s $1/fuzzy.h .
fi

if [ ! -f fuzzy.cc ]; then
    ln -s $1/fuzzy.cc .
fi

# Running the tester

echo -e "+============================+"
echo -e "| Testing Fuzzy Numbers Task |"
echo -e "+============================+"

for directory in */ ; do
    echo -e "=========================================="
    echo -e "${BLUE}Testing $directory${CLEAR}"

    if g++-10 -Wall -Wextra -O2 -std=c++20 ${directory}*.cc fuzzy.cc; then
        echo -e "${GREEN}Compiled${CLEAR}"

        if ./a.out; then
            echo -e "${GREEN}Finished successfully${CLEAR}"
        else
            echo -e "${RED}Finished with exit code $?${CLEAR}"
        fi

        rm a.out
    else
        echo -e "${RED}Test didn't compile.${CLEAR}"
    fi

    echo -e "${BLUE}End${CLEAR}"
done
