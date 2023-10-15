#!/bin/bash
set -ex

repos="libsigrok libsigrokdecode sigrok-cli pulseview"

for repo in $repos; do
  if [ ! -d "$repo" ]; then
    git clone "git://sigrok.org/$repo"
  else
    (cd "$repo" && git pull)
  fi
done

