sudo apt-get install libstdc++5
sudo apt-get -y install libncurses5 libtommath1
wget https://github.com/FirebirdSQL/firebird/releases/download/R2_5_9/FirebirdSS-2.5.9.27139-0.amd64.tar.gz
tar -xzvf FirebirdSS-2.5.9.27139-0.amd64.tar.gz
cd $HOME
tar -xzvf FirebirdSS-2.5.9.27139-0.amd64.tar.gz
cd FirebirdSS-2.5.9.27139-0.amd64
sudo ./install.sh

# After installed
sudo ln -s /opt/firebird/lib/libfbclient.so.2.5.9 /usr/lib/libfbclient.so.2.5.1