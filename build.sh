#!/bin/bash
set -ex

source .envrc

build() (
  set -ex
  echo ==============================
  echo $1
  echo ==============================

  if [ ! -d "$1" ]; then
	git clone git://sigrok.org/"$1"
  fi
  
  cd "$1"

  if [ "$1" = "pulseview" ]; then
    if [ ! -d CMakeFiles ]; then
        export PKG_CONFIG_PATH
        cmake . -DCMAKE_INSTALL_PREFIX:string=$PREFIX -DENABLE_TESTS=n
    fi
  elif [ ! -f ./configure ]; then
    ./autogen.sh
    ./configure --prefix=$PREFIX PKG_CONFIG_PATH=$PKG_CONFIG_PATH --enable-java=0 --enable-ruby=0
  fi
  make -j$(nproc) install
)

build libsigrok
build libsigrokdecode
build sigrok-cli
build sigrok-firmware
build pulseview
