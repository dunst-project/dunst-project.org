#!/bin/bash
set -e

usage()
{
	echo "Usage:"
	echo "$(basename $0) [-p]"
	echo "-p: push the changes to the gh-pages and master branches"
	echo "-f: add --force"
}

declare PUSH
declare FORCE

while getopts 'hpf' c
do
	case $c in
		h) usage; exit ;;
		p) PUSH=1 ;;
		f) FORCE=1 ;;
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
	if [ ! -z $FORCE ]; then
		git push --force
		cd ..
		git push --force
	else
		git push
		cd ..
		git push
	fi
fi
