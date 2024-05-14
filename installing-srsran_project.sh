#!/bin/bash

echo "Installing dependencies..."

sudo apt install cmake make gcc g++ pkg-config libfftw3-dev libmbedtls-dev libsctp-dev libyaml-cpp-dev libgtest-dev docker-compose 

sudo apt install ccache libbackward-cpp-dev

echo "Fixing a probably error on uhd, ensuring uhd 3.15 in installed."

sudo apt remove uhd-host=4.1.0.5-3 libuhd4.1.0 

sudo apt install uhd-host=3.15.0.0-2build5 libuhd3.15.0 libuhd-dev=3.15.0.0-2build5 

echo "Clonning srsran_Project and creating build..."

git clone https://github.com/srsRAN/srsRAN_Project.git 

cd srsRAN_Project 

mkdir build 

cd build 

echo "Running CMAKE..."

cmake ../ 

echo "Compiling lib srsRAN_Project..."

make -j $(nproc) 

echo "Testing lib srsRAN_Project..."

make test -j $(nproc) 

echo "Installing lib srsRAN_Project..."

sudo make install

echo "Moving libs to enable use from any place..."

sudo mv /usr/local/lib/* /usr/lib/

echo "Enabling performance configurations..."

sudo srsRAN_Project/scripts/srsran_performance

echo "Downloading configuration files on srsRAN_Project/configs dir..."

wget https://docs.srsran.com/projects/project/en/latest/_downloads/900a04eeabbe80c1bb9f3e571afaa804/ue_rf.conf -P srsRAN_Project/configs/

cp srsRAN_Project/configs/gnb_rf_b210_fdd_srsUE.yml srsRAN_Project/configs/gnb.yml

echo "TO A EXPERIMENT WITH gNB AND srsUE on 5G, remember to change clock=internal in gnb.yml and ue_rf.yml if you don't have external GPSIO!!!"

echo "Installation complete !!! Use the dockerized version of OPEN5GS to run experiments !!!"
