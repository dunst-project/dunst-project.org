#!/bin/sh

# Environment:
#       * REPO: the location of the dunst repo

OLDVER="$1"
NEWVER="$2"

usage(){
        echo "Usage: REPO=../dunst $(basename $0) OLDVER NEWVER
        Versions should be given in the format: x.y.z
        The REPO variable should point to the dunst git repository that is currently in the latest master"
        exit
} 

while getopts 'h' c
do
	case $c in
		h) usage; exit ;;
	esac
done

shift $((OPTIND-1))

if [ "$#" -ne 2 ]
then
        echo "Not the right number of arguments"
        usage
fi

if [ -z "$REPO" ]
then
        echo "You should set the REPO environment variable"
        usage
fi

sed -i "s/$OLDVER/$NEWVER/g" "content/download.md"

echo "Manually change the release date in the download file please. Opening in nvim..."
sleep 2
nvim content/download.md

cp "$REPO/CHANGELOG.md" "content/changelog.md"
pod2html < "$REPO/docs/dunst.5.pod" | cat  "helper_files/documentation_header.md" - > "content/documentation.md"
