#!/bin/sh

npm install ts-node
npx ts-node generate.ts


function check_uncommitted_changes() {
  status=$(git status --porcelain)
  if [ -n "$status" ]; then
    # status="${status//'%'/'%25'}"
    # status="${status//$'\n'/'%0A'}"
    # status="${status//$'\r'/'%0D'}"
    echo -e "Following computed files are missing in PR\n"
    echo "$status"
    exit 1
  else
    echo "Computed Files are up to date."
    exit 0
  fi
}

echo $(check_uncommitted_changes)