#!/bin/sh

# Symlink to default locations
for fn in $(cat tools/locations); do
	[ -z "$fn" ] && continue
	ln -vsi $PWD/$fn $HOME/.$fn
done
