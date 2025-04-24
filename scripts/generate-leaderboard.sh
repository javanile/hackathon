#!/usr/bin/env bash

GITHUB_USER="javanile"
REPO_NAME="mush-get-started"
TOKEN="${GITHUB_TOKEN}"

FORKS=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/$GITHUB_USER/$REPO_NAME/forks" | jq -r '.[] | {full_name, stargazers_count}')

rm -f data/leaderboard.*
echo "Fork trovati per $GITHUB_USER/$REPO_NAME:"
for FORK in $(echo "$FORKS" | jq -r '.full_name'); do
    STARS=$(echo "$FORKS" | jq -r "select(.full_name == \"$FORK\") | .stargazers_count")
    echo "Processing fork: $FORK, Stars: $STARS"

    WORKFLOW=".github/workflows/@${FORK//\//@}.yml"
    PACKAGE_NAME="${FORK#*/}"
    PACKAGE_USER="${FORK%%/*}"
    cp .github/workflows/template.yml "${WORKFLOW}"
    sed -i "s|name: template|name: build|g" "${WORKFLOW}"
    sed -i "s|PACKAGE_NAME: console|PACKAGE_NAME: ${PACKAGE_NAME}|g" "${WORKFLOW}"
    sed -i "s|PACKAGE_USER: francescobianco|PACKAGE_USER: ${PACKAGE_USER}|g" "${WORKFLOW}"
    echo "${STARS} ${FORK}" >> data/leaderboard.txt
done

echo "[" > data/leaderboard.json
sort -nr data/leaderboard.txt | awk '{print "{\"rank\":" NR ", \"project\":\"" $2 "\", \"stars\":" $1 "},"}' >> data/leaderboard.json
echo "{}" >> data/leaderboard.json
echo "]" >> data/leaderboard.json
