#!/usr/bin/env bash

cat assets/readme/header.md > README.md

echo "[![Leaderboard](https://github.com/javanile/hackathon/actions/workflows/leaderboard.yml/badge.svg)](https://github.com/javanile/hackathon/actions/workflows/leaderboard.yml)" >> README.md
echo "![Last Update](https://img.shields.io/badge/Last%20Update-$(date -u +%Y--%m--%d%%20%H%%3A%M%%3A%S)%20UTC-blue)  " >> README.md

cat assets/readme/intro.md >> README.md

echo "### 📊 Current Leaderboard" >> README.md
echo "| Rank | Project                         | Stars ⭐ | CI/CD Status |" >> README.md
echo "|:----:|---------------------------------|:-------:|--------------|" >> README.md
rank=1
sort -nr data/leaderboard.txt | while read -r line; do
  STARS=$(echo "$line" | awk '{print $1}')
  FORK=$(echo "$line" | awk '{print $2}')
  PACKAGE_NAME="${FORK#*/}"
  PACKAGE_USER="${FORK%%/*}"
  JOB="@${FORK//\//@}.yml"
  WORKFLOW_STATUS="[![Status](https://github.com/javanile/hackathon/actions/workflows/${JOB}/badge.svg)](https://github.com/javanile/hackathon/actions/workflows/${JOB})"
  echo "| ${rank} | [${FORK}](https://github.com/${FORK}) | ${STARS} | ${WORKFLOW_STATUS} |"  >> README.md
  rank=$((rank + 1))
done


echo "### 🏅 Hall of Fame" >> README.md
echo "| Month    | Year | Winning Project                   |" >> README.md
echo "|----------|------|------------------------------------|" >> README.md
echo "| January  | 2024 | francescobianco/matrix-theme       |" >> README.md

cat assets/readme/outro.md >> README.md
