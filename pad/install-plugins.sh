#!/bin/bash
set -e

while read PLUGIN; do
    npm install ${PLUGIN}
done <./plugins.txt
