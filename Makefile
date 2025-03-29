

release:
	@bash scripts/generate-leaderboard.sh
	@git pull --no-rebase
	@git add .
	@git commit -am "Hackathon Update: $$(date -u)" || true
	@git push

test-generate-leaderboard:
	@bash scripts/generate-leaderboard.sh
