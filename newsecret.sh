#!/bin/bash

# Summary: This simple script creates a new branch based on your git username, and a datetimestamp.
#          Creates a new stripe like secret and adds it to a file and push to main

#TODO: Make Alias for creation and cleanup of current test.
#TODO: Handle failures better. things like making sure you are branching from main etc.

username=$(git config user.email)
${username%@*}

branchname=${username%@*}-$(date +%Y%m%d%H%M%S)
echo $branchname

git checkout main
git checkout -b $branchname

basestripestring="sk_live_"
stringrand=$(openssl rand -hex 50 | head -c 99)
echo $basestripestring$stringrand >> secrets.md

# git add secrets.md && git commit -am "${username%@*} is testing push protection"