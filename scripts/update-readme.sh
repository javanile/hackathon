#!/usr/bin/env bash

cat assets/readme/header.md > README.md

echo "[![Leaderboard](https://github.com/javanile/hackathon/actions/workflows/leaderboard.yml/badge.svg)](https://github.com/javanile/hackathon/actions/workflows/leaderboard.yml)" >> README.md
echo "![Last Update](https://img.shields.io/badge/Last%20Update-$(date -u +%Y--%m--%d%%20%H%%3A%M%%3A%S)%20UTC-blue)  " >> README.md

cat assets/readme/intro.md >> README.md

echo "### 📊 Current Leaderboard" >> README.md
echo "| Rank | Project                         | Stars ⭐ | CI/CD Status |" >> README.md
echo "|------|----------------------------------|----------|---------------|" >> README.md
echo "| 1    | francescobianco/matrix-theme     | 3        | ✅            |"  >> README.md

echo "### 🏅 Hall of Fame" >> README.md
echo "| Month    | Year | Winning Project                   |" >> README.md
echo "|----------|------|------------------------------------|" >> README.md
echo "| January  | 2024 | francescobianco/matrix-theme       |" >> README.md

cat assets/readme/outro.md >> README.md
