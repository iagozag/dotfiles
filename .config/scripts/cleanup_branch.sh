#!/bin/bash

# Fetch and prune remote branches
git fetch -p

# Loop through remote tracking branches marked as ": gone]" and delete them
for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do
  git branch -D $branch
done
