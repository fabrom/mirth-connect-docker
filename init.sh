#!/bin/sh

# MirthConnect local datas ---
mkdir -p ./data/mirth-connect/conf/
mkdir -p ./data/mirth-connect/custom-lib/
mkdir -p ./data/mirth-connect/spools/
cp -n ./mirth-connect/conf/dbdrivers.xml ./data/mirth-connect/conf/dbdrivers.xml

# NGINX local datas ---
mkdir -p ./data/rp-https/conf/nginx/conf.d
mkdir -p ./data/rp-https/conf/ssl
cp -Rn ./rp-https/conf/* ./data/rp-https/conf/
