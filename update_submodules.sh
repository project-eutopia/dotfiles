#!/bin/bash

cd bundle

for d in *; do
  if [[ -d $d ]]; then
    echo "Working on '$d'..."
    cd $d
    git checkout master
    git pull
    cd ..
  fi
done

cd ..
