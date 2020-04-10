#!/usr/bin/env bash

BOTTOM=$(grep BOTTOM .env | cut -d '=' -f2 | cut -d '#' -f1)
echo

if [ $BOTTOM = "host" ]; then
  export APP_PATH=$PWD
elif [ $BOTTOM = "machine" ]; then
  export APP_PATH=${PWD/home/hosthome}
fi

docker run --rm -it \
  -e APP_PATH=${APP_PATH} \
  -v ${APP_PATH}:/myapp \
  -v ${APP_PATH}/tmp:/tmp \
  -v ${APP_PATH}/.bash_history:/root/.bash_history \
  danlynn/ember-cli:3.13.0-node_12.10 \
  bash $@

echo
echo
