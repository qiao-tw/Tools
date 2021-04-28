#!/usr/bin/env bash

# display every step
set -x

case "$(uname -s)" in
  Darwin)
  ;;

  Linux)
    # ssh-key
	ssh-keygen -t rsa -b 4096 -C "qiao.helloworld@gmail.com"
	ssh-add ~/.ssh/id_rsa

	read -p "add SSH key to github, then press [ENTER] to continue... " -n1 -s

	# coding friends
	sudo apt-get update
	sudo apt-get install -y git gitk gitweb git-gui nano vim meld openssh-server tree build-essential curl file

  # homebrew
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

	# customize bash environment
	mkdir -p ${HOME}/Tools && cd ${HOME}/Tools
	git clone https://github.com/huang-qiao/dot_files.git
	cd ${HOME}
	echo "# qiao's extra bash settings" >> ${HOME}/.bashrc
	echo "source ${HOME}/Tools/dot_files/dot_bashrc" >> ${HOME}/.bashrc

  # git-toolbelt
  source ${HOME}/.bashrc
  brew install fzf
  brew tap nvie/tap
  brew install nvie/tap/git-toolbelt

  # Android Studio (mksdcard)
	$ sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1

	# git global setting
	git config --global user.email "qiao.helloworld@gmail.com"
	git config --global user.name "qiao"

	# optional - KVM for android/qemu emulator
	egrep -c '(vmx|svm)' /proc/cpuinfo # result should >= 1
	sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
	sudo adduser `id -un` libvirtd
	sudo apt-get install -y virt-manager
esac
