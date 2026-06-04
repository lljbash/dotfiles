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
	if [[ "$(uname)" == "Darwin" ]]; then
		# macOS: search in Xcode/CommandLineTools and Homebrew paths
		find /Library/Developer/CommandLineTools/usr/lib \
			/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib \
			/opt/homebrew/opt/llvm/lib \
			/usr/local/opt/llvm/lib \
			-name "${LIB}*" -print -quit 2>/dev/null | grep -q . || (echo "not found" && false)
	else
		ldconfig -p | grep -q "$LIB" || (echo "not found" && false)
	fi
	echo "ok"
done
