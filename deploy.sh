#!/bin/bash

usage()
{
	echo "Usage:"
	echo "$(basename $0) [-p]"
	echo "-p: push the changes to the gh-pages and master branches"
}

declare PUSH

while getopts 'hp' c
do
	case $c in
		h) usage; exit ;;
		p) PUSH=1 ;;
	esac
done

if [ ! -d "public/" ]; then
	git worktree add public/ gh-pages
fi

hugo
COMMIT="$(git rev-parse HEAD | cut -b1-7)"
cd public/
git add -A
git commit -m "Deploy $COMMIT"

if [ ! -z $PUSH ]; then
	git push
	cd ..
	git push
fi
