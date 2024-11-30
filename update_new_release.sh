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

echo "Manually change the release date in the download file please. Opening in $EDITOR..."
sleep 1
$EDITOR content/download.md

# CHANGELOG
cat << EOF > content/changelog.md
+++
weight = 5
title = "Changelog"
menu = "main"
type = "page"
+++

EOF
tail -n +2 "$REPO/CHANGELOG.md" >> "content/changelog.md"
sed -i 's/## \([0-9]\+\.[0-9]\+\.[0-9]\+\).*/\0  <div class="releaseref"><i class="fa fa-sticky-note"><\/i> [Release Notes]({{< ref "\/release#v\1" >}})<\/div> {#v\1}/' "content/changelog.md"
sed -i 's/#\([0-9]\+\)/[#\1](https:\/\/github.com\/dunst-project\/dunst\/issues\/\1)/g' "content/changelog.md"

# RELEASE
cat << EOF > content/release.md
+++
weight = 5
title = "Release Notes"
type = "page"
+++

EOF
cat "$REPO/RELEASE_NOTES" >> "content/release.md"
sed -i ':a;N;$!ba;s/====*\nRelease Notes For \(v[0-9]\+\.[0-9]\+\.[0-9]\+\)\n====*/## Dunst \1 <div class="releaseref"><i class="fa fa-sticky-note"><\/i> [Changelog]({{< ref "\/changelog#\1" >}})<\/div> {#\1}\n***\n/g' "content/release.md"

#sed -i ':a;N;$!ba;s/====*\nRelease Notes For \(v[0-9]\+\.[0-9]\+\.[0-9]\+\)\n====*/# Dunst \1 <i class="fa fa-sticky-note"><\/i>{#\1}/g' "content/release.md"

# DOCUMENTATION
pod2html < "$REPO/docs/dunst.5.pod" | cat  "helper_files/documentation_header.md" - > "content/documentation.md"
