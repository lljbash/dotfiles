#!/bin/bash

set -e

for APP in \
	curl wget git tar unzip gunzip ip \
	zsh tmux \
	xsel fzf \
	gcc g++ cmake ccache ninja \
	sqlite3; do
	echo -n "Checking $APP... "
	command -v $APP || (echo "not found" && false)
done

# check libraries (not CLI commands)
# shellcheck disable=SC2043
for LIB in \
	libclang; do
	echo -n "Checking $LIB... "
	ldconfig -p | grep -q $LIB || (echo "not found" && false)
	echo "ok"
done
