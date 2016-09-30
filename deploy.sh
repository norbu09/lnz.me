#!/bin/sh

echo -e "\033[0;32mDeploying updates...\033[0m"

# Build the project.
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git pull --rebase
git push origin master

echo -e "\033[0;32mUpdating site on server...\033[0m"
ssh norbu09.org 'cd lnz.me && git pull'
open http://lnz.me

