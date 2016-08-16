#!/bin/sh
DIR=build
mkdir -p $DIR

rm -rf $DIR/*
CC=g++
YH="-g -rdynamic -DOPENSSL=1 -DOPENSSLDL=0"
$CC  $YH  -c sendmsg.cpp -o $DIR/sendmsg.o
$CC  $YH -c cJSON.c -o $DIR/cJSON.o
$CC  $YH -c main.cpp -o $DIR/main.o
$CC  $YH  -c nonblocking.cpp -o $DIR/nonblocking.o
$CC  $YH -c sslbio.cpp -o $DIR/sslbio.o
$CC  $YH -c ngrok.cpp  -o $DIR/ngrok.o


$CC $DIR/main.o $DIR/cJSON.o $DIR/sendmsg.o $DIR/nonblocking.o $DIR/sslbio.o  $DIR/ngrok.o -o $DIR/ngrokc $YH -lssl -lcrypto  libpolarssl-linux.a
