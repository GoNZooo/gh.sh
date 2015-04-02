#!/bin/bash

COMMAND=$1
USER=$2

case "$COMMAND" in
	cl*)
		git clone git@github.com:$USER/$3.git
		;;
esac
