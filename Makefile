

release:
	@bash scripts/generate-leaderboard.sh
	@git pull --no-rebase
	@git add .
	@git commit -am "Hackathon Update: $$(date -u +'%Y-%m-%dT%H:%M:%SZ')" || true
	@git push

test-generate-leaderboard:
	@bash scripts/generate-leaderboard.sh
