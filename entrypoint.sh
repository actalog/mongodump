#!/bin/sh -l

apt update && apt upgrade -y
apt install zip -y

cd /action
mongodump $1

zip -P $2 -r dump.zip dump
rm -rf dump

mkdir $GITHUB_WORKSPACE/dump
cp -r dump.zip $GITHUB_WORKSPACE/dump
