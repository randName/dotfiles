#!/bin/sh

files=$(cat <<EOF
zshenv
zshrc
vimrc
lesskey
tmux.conf
gitconfig
gitignore
EOF
)

ddir="$(dirname $0)"

# Symlink to default locations
for f in $files; do
	fn="$ddir/$f"
	[ -z "$fn" ] && continue
	ln -vsb $fn $HOME/.$f
done
