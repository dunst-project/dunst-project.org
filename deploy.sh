#!/bin/bash
set -e

if [ ! -d "public/" ]; then
	git worktree add public/ gh-pages
fi

hugo
COMMIT="$(git rev-parse HEAD | cut -b1-7)"
cd public/
git add -A
git commit -m "Deploy $COMMIT"
