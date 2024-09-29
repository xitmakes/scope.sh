#!/bin/bash

# ANSI Color Codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Header
echo -e "${BLUE}==================================${NC}"
echo -e "${YELLOW}       scope.sh by xitsec        ${NC}"
echo -e "${BLUE}==================================${NC}"

# Fetch the CSV and split the results into wildcard and regular domain files
curl -s https://hackerone.com/teams/$1/assets/download_csv.csv | \
    awk -F',' '{print $1}' | grep -Eo '(\*\.[a-zA-Z0-9._-]+\.[a-zA-Z]{2,}|[a-zA-Z0-9._-]+\.[a-zA-Z]{2,})' | while read line
do
    if [[ $line == \*.* ]]; then
        echo -e "${GREEN}Wildcard domain: $line${NC}"  # Green for wildcard domains
        echo $line >> wildcards
    else
        echo -e "${RED}Regular domain: $line${NC}"   # Red for regular domains
        echo $line >> domains
    fi
done

# Notify users about the saved files
echo -e "${BLUE}-----------------------------------${NC}"
echo -e "${GREEN}Wildcard domains saved in 'wildcards' file.${NC}"
echo -e "${GREEN}Regular domains saved in 'domains' file.${NC}"
