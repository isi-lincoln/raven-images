#!/bin/bash

set -e
set -x

sudo apt-get update
sudo apt-get install -y \
	vim \
	tmux \
	bash-completion \
	ssh \
	tree \
	nfs-common
