#!/bin/bash

# This file will have a line like
# 'export GITHUB_REPO_TOKEN="token_value"'
if [[ -r "$GITHUB_REPO_TOKEN_LOC" ]]; then
	source "$GITHUB_REPO_TOKEN_LOC"
else
	exit 1
fi

HTTPIE_FLAGS="--print b"

COMMAND=$1

case "$COMMAND" in
	cl*)
		USER="$2"
		REPONAME="$3"
		git clone "git@github.com:$USER/$3.git"
		;;
	cr*)
		REPONAME="$2"
		http $HTTPIE_FLAGS "https://api.github.com/user/repos" "Authorization:token $GITHUB_REPO_TOKEN" "name=$REPONAME"
esac
