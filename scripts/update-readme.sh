#!/usr/bin/env bash

echo "# Hackathon" > README.md
echo "[![Leaderboard](https://github.com/javanile/hackathon/actions/workflows/leaderboard.yml/badge.svg)](https://github.com/javanile/hackathon/actions/workflows/leaderboard.yml)" >> README.md
echo "![Last Update](https://img.shields.io/badge/Last%20Update-$(date -u +%Y--%m--%d%%20%H%%3A%M%%3A%S)%20UTC-blue)  " >> README.md
echo "Hackathon  " >> README.md