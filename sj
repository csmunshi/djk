#!/bin/bash

# Configuration (run once)
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

# Initialize the repository (if not already initialized)
git init

# Loop for making commits on 30 distinct days
for i in {1..30}
do
  # Create or modify a file
  echo "Commit made on $(date)" >> daily_commit.txt

  # Stage the changes
  git add daily_commit.txt

  # Commit with a message
  git commit -m "Commit for day $i"

  # Change the date of the commit to simulate different days
  GIT_COMMITTER_DATE="$(date -d "$i days ago")" git commit --amend --no-edit --date "$(date -d "$i days ago")"
done

# Push all changes to the remote repository
git push origin <branch-name>
