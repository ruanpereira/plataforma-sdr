#!/usr/bin

sudo apt install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev git

sudo apt install libdw-dev libpcsclite-dev

sudo apt install uhd-host=3.15.0.0-2build5 libuhd3.15.0 libuhd-dev=3.15.0.0-2build5

sudo uhd_images_downloader

git clone https://github.com/srsRAN/srsRAN_4G.git

cd srsRAN_4G

mkdir build

cd build

cmake ../

make

make test

sudo make install

sudo mv /usr/local/lib/* /usr/lib/
