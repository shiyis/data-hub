#!/bin/bash

OWNER="shiyis"
CONTRIBUTOR="oreoeuphoreo"

# List all repositories of the owner and iterate through each one
gh repo list "$OWNER" --limit 100 --json name -q '.[].name' | while read -r REPO; do
  echo "Removing $CONTRIBUTOR from $OWNER/$REPO"
  gh api -X DELETE -H "Accept: application/vnd.github.v3+json" "/repos/$OWNER/$REPO/collaborators/$CONTRIBUTOR"
done
