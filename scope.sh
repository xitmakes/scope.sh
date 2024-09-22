#!/bin/bash
curl https://hackerone.com/teams/$1/assets/download_csv.csv | grep *. | awk -F ',' '{print $1}'   | tee wildcards

