#!/usr/bin

echo "Installing dependencies..."

sudo apt install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev git

sudo apt install libdw-dev libpcsclite-dev

sudo apt install uhd-host=3.15.0.0-2build5 libuhd3.15.0 libuhd-dev=3.15.0.0-2build5

echo "Installing images of usrp hardware for UHD lib..."

sudo uhd_images_downloader

echo "Clonning github..."

git clone https://github.com/srsRAN/srsRAN_4G.git

cd srsRAN_4G

mkdir build

cd build

echo "Executing CMAKE..."

cmake ../

echo "Compiling lib srsran4g..."

make

echo "Testing lib srsran4g..."

make test

echo "Installing lib srsran4g..."

sudo make install

echo "Moving lib sources to right place to enable execution from any place, also installing config files..."

sudo mv /usr/local/lib/* /usr/lib/

sudo srsran_install_configs.sh user

cd ../../

echo "Installation finished!!!!!! Test with sudo srsepc, sudo srsenb or sudo srsue"
