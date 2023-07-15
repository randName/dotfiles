#!/bin/sh

# Symlink to default locations
for fn in $(cat $(dirname $0)/locations); do
	[ -z "$fn" ] && continue
	ln -vs --backup=existing $PWD/$fn $HOME/.$fn
done
