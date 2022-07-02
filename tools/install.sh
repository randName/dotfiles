#!/bin/sh

# Symlink to default locations
for fn in $(cat tools/locations); do
	[ -z "$fn" ] && continue
	ln -vs --backup=existing $PWD/$fn $HOME/.$fn
done

# Generate .less
lesskey lesskey
