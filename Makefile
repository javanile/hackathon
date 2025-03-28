

release:
	@bash scripts/generate-leaderboard.sh
	@git add .
	@git commit -am "New release!"
	@git push

test-generate-leaderboard:
	@bash scripts/generate-leaderboard.sh
