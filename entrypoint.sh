#!/bin/sh -l

apt update && apt upgrade -y

cd /action
mongodump $1
mkdir $GITHUB_WORKSPACE/dump
cp -r dump $GITHUB_WORKSPACE/dump
