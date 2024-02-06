#!/bin/sh


npx ts-node ../script/generate.ts

status=$(git status --porcelain)
if [ -n "$status" ]; then
    echo "Following computed files are missing in PR"
    echo "$status"
    exit 1
else
    echo "Computed Files are up to date."
    exit 0
fi
