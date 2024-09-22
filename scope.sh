#!/bin/bash
curl -s https://hackerone.com/teams/$1/assets/download_csv.csv | \
    grep -Eo '(\*\.|www\.)[a-zA-Z0-9._-]+\.[a-zA-Z]{2,}' | tee wildcards
