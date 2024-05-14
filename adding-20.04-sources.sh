#!/bin/bash

echo "

# Ubuntu 20.04 sources list

deb http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse 
deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted universe multiverse 
 
deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse 
deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse 
 
deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse 
deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse 
 
deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse 
deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse 
 
deb http://archive.canonical.com/ubuntu focal partner 
deb-src http://archive.canonical.com/ubuntu focal partner" >> /etc/apt/sources.list

sudo apt update && sudo apt upgrade
