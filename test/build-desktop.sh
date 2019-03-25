#!/bin/sh
set -x

rm -rf BoscaCeoil.app
rm -rf BoscaCeoil.swf

amxmlc -swf-version 28 -default-frame-rate 30 -default-size 768 560 -library-path+=lib/sion065.swc -source-path+=src -default-background-color 0x000000 -warnings -strict src/Main.as -o BoscaCeoil.swf -define+=CONFIG::desktop,true -define+=CONFIG::web,false || exit 1

# adl application.xml

# adt -certificate -cn asdf 2048-RSA cert.p12 dummypass
# adt -package -storetype pkcs12 -keystore cert.p12 -storepass dummypass -target bundle BoscaCeoil.app application.xml BoscaCeoil.swf assets

if [ ! -f "cert.p12" ]
then
  adt -certificate -cn name 2048-RSA cert.p12 dummypass || exit 1
fi

if [ ! -f "cert.p12" ]
then
  echo "cert.p12 not found!"
  exit 2
fi

adt -package -storetype pkcs12 -keystore cert.p12 -storepass dummypass -target bundle BoscaCeoil.app application.xml BoscaCeoil.swf assets || exit 2
