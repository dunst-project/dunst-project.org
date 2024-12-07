#!/bin/sh

# Environment:
#       * REPO: the location of the dunst repo


if [ -z "$REPO" ]
then
        echo "You should set the REPO environment variable"
		exit 1
fi

WIKIREPO="dunst.wiki"

# CHANGELOG
cp "helper_files/changelog_header.md" "content/changelog.md"
tail -n +2 "$REPO/CHANGELOG.md" >> "content/changelog.md"
sed -i 's/## \([0-9]\+\.[0-9]\+\.[0-9]\+\).*/\0  <div class="flabel"><i class="fa fa-sticky-note"><\/i> [Release Notes]({{< ref "\/release#v\1" >}})<\/div> {#v\1 .spaced}\n****/' "content/changelog.md"
sed -i 's/#\([0-9]\+\)/[#\1](https:\/\/github.com\/dunst-project\/dunst\/issues\/\1)/g' "content/changelog.md"

# RELEASE
cp "helper_files/release_header.md" "content/release.md"
cat "$REPO/RELEASE_NOTES" >> "content/release.md"
sed -i ':a;N;$!ba;s/====*\nRelease Notes For \(v[0-9]\+\.[0-9]\+\.[0-9]\+\)\n====*/## Dunst \1 <div class="flabel"><i class="fa fa-refresh"><\/i> [Changelog]({{< ref "\/changelog#\1" >}})<\/div> {#\1 .spaced}\n***\n/g' "content/release.md"

# DOCUMENTATION
from="docs/dunst.5.pod"
dest="content/documentation/_index.md"
title="Dustrc"
cp "helper_files/documentation_header.md" "$dest"
sed -i 's/TITLE/"dunst(5)"/' "$dest"
date="$(git -C "$REPO" log -1 --pretty='format:%as' "$from")"
sed -i "s/DATE/\\\"$date\\\"/" "$dest"
sed -i "s/DESC/\\\"$title manual page\\\"/" "$dest"
sed -i 's/WIKI/false\nmenu = "main"\nweight = 3/' "$dest"
pod2html < "$REPO/$from" >> "$dest"


from="docs/dunst.1.pod"
dest="content/documentation/dunst.md"
title="Dunst"
cp "helper_files/documentation_header.md" "$dest"
sed -i 's/TITLE/"dunst(1)"/' "$dest"
date="$(git -C "$REPO" log -1 --pretty='format:%as' "$from")"
sed -i "s/DATE/\\\"$date\\\"/" "$dest"
sed -i "s/DESC/\\\"$title manual page\\\"/" "$dest"
sed -i 's/WIKI/false/' "$dest"
pod2html < "$REPO/$from" >> "$dest"


from="docs/dunstctl.pod"
dest="content/documentation/dunstctl.md"
title="Dunstctl"
cp "helper_files/documentation_header.md" "$dest"
sed -i 's/TITLE/"dunstctl"/' "$dest"
date="$(git -C "$REPO" log -1 --pretty='format:%as' "$from")"
sed -i "s/DATE/\\\"$date\\\"/" "$dest"
sed -i "s/DESC/\\\"$title manual page\\\"/" "$dest"
sed -i 's/WIKI/false/' "$dest"
pod2html < "$REPO/$from" >> "$dest"


from="docs/dunstify.pod"
dest="content/documentation/dunstify.md"
title="Dunstify"
cp "helper_files/documentation_header.md" "$dest"
sed -i 's/TITLE/"dunstify"/' "$dest"
date="$(git -C "$REPO" log -1 --pretty='format:%as' "$from")"
sed -i "s/DATE/\\\"$date\\\"/" "$dest"
sed -i "s/DESC/\\\"$title manual page\\\"/" "$dest"
sed -i 's/WIKI/false/' "$dest"
pod2html < "$REPO/$from" >> "$dest"


# WIKI
git submodule update --init --remote dunst.wiki
echo "You should check if the wiki pages have not been tampered with before deploying!"

from="Dependencies.md"
dest="content/documentation/dependencies.md"
title="Dependencies"
cp "helper_files/documentation_header.md" "$dest"
sed -i 's/TITLE/"Dependencies"/' "$dest"
date="$(git -C "$WIKIREPO" log -1 --pretty='format:%as' "$from")"
sed -i "s/DATE/\\\"$date\\\"/" "$dest"
sed -i "s/DESC/\\\"$title wiki page\\\"/" "$dest"
sed -i 's/WIKI/true\nweight = 1/' "$dest"
cat "$WIKIREPO/$from" >> "$dest"


from="Installation.md"
dest="content/documentation/installation.md"
title="Installation"
cp "helper_files/documentation_header.md" "$dest"
sed -i 's/TITLE/"Installation"/' "$dest"
date="$(git -C "$WIKIREPO" log -1 --pretty='format:%as' "$from")"
sed -i "s/DATE/\\\"$date\\\"/" "$dest"
sed -i "s/DESC/\\\"$title wiki page\\\"/" "$dest"
sed -i 's/WIKI/true\nweight = 2/' "$dest"
cat "$WIKIREPO/$from" >> "$dest"


from="Guides.md"
dest="content/documentation/guides.md"
title="Guides"
cp "helper_files/documentation_header.md" "$dest"
sed -i "s/TITLE/\\\"$title\\\"/" "$dest"
date="$(git -C "$WIKIREPO" log -1 --pretty='format:%as' "$from")"
sed -i "s/DATE/\\\"$date\\\"/" "$dest"
sed -i "s/DESC/\\\"$title wiki page\\\"/" "$dest"
sed -i 's/WIKI/true\nweight = 3/' "$dest"
cat "$WIKIREPO/$from" >> "$dest"
