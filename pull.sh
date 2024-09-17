#!/bin/bash
set -ex

find ./* -name .git | while read -r repo; do (
	cd "$repo"/..
	git pull
) done
