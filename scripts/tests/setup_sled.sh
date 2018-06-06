export GOROOT=~/go
export GOPATH=/tmp/go
export PATH=$PATH:$GOROOT/bin/:$GOPATH/bin

cd ~/
# install go, cant do apt-get as that is go-1.6 require 1.8 min
wget https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz
tar -xzf go1.10.2.linux-amd64.tar.gz
sudo ln -s $GOROOT/bin/go /usr/local/bin/go

# install go dep
mkdir -p $GOPATH/bin
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

PREFIXRC=$GOPATH/src/github.com/rcgoodfellow
mkdir -p $PREFIXRC
cd $PREFIXRC
git clone https://github.com/rcgoodfellow/raven.git
cd raven
# install ansible
sudo ./setup-ansible.sh
# install prereqs for raven (other than go)
sudo ansible-playbook setup.yml
# install dependencies for raven
dep ensure
# build and install the current version of raven, not the release version
sudo make
sudo make install

PREFIXCEF=$GOPATH/src/github.com/ceftb
mkdir -p $PREFIXCEF
cd $PREFIXCEF
git clone https://github.com/ceftb/sled
cd sled
dep ensure
