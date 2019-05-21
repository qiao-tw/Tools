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

	# qiao's coding friends
	sudo apt-get update
	sudo apt-get install -y git vim geany meld openssh-server tomcat7 ctags gitk gitweb git-gui tree clang-format-3.6 clang-3.6

	# qiao's working environment
	mkdir -p ${HOME}/Tools && cd ${HOME}/Tools
	git clone https://github.com/huang-qiao/dot_files.git
	cd ${HOME}
	echo "# qiao's extra bash settings" >> ${HOME}/.bashrc
	echo "source ${HOME}/Tools/dot_files/bashrc.extra" >> ${HOME}/.bashrc

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
