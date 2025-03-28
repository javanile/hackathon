#!/usr/bin/env bash

GITHUB_USER="javanile"
REPO_NAME="mush-get-started"
TOKEN="${GITHUB_TOKEN}"

FORKS=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/$GITHUB_USER/$REPO_NAME/forks" | jq -r '.[].full_name')

echo "Fork trovati per $GITHUB_USER/$REPO_NAME:"
for FORK in $FORKS; do
    echo "Processing fork: $FORK"
    # Puoi eseguire operazioni su ogni fork, ad esempio clonarlo:
    # git clone "https://github.com/$FORK.git"
    WORKFLOW=".github/workflows/project@${FORK//\//@}.yml"
    cp .github/workflows/template.yml "${WORKFLOW}"
    sed -i "s|PACKAGE_NAME: console|PACKAGE_NAME: ${FORK#*/}|g" "${WORKFLOW}"
done

