FROM osrf/ros:melodic-desktop-full
MAINTAINER Ubuntu Build Eng "qiao <qiao.helloworld@gmail.com>"

USER root
ENV DEBIAN_FRONTEND noninteractive

# For development, do not exclude man pages & other documentation
RUN rm -f /etc/dpkg/dpkg.cfg.d/excludes

# upgrade system
RUN apt-get update && \
    apt-get -y upgrade && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y apt-utils && \
    rm -rf /var/lib/apt/lists/*

# Common
RUN apt-get update && \
    apt-get install -y \
      autoconf \
      build-essential \
      bzip2 \
      cmake \
      coreutils \
      curl \
      git \
      google-mock \
      googletest \
      libboost-all-dev \
      libeigen3-dev \
      libgflags-dev \
      libgoogle-glog-dev \
      libgtest-dev \
      libsuitesparse-dev \
      libtool \
      lsb-release \
      make \
      minicom \
      ninja-build \
      pkg-config \
      sudo \
      vim \
      wget \
      zip \
      zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Add custom user
ARG USER
ARG UID
ARG GID
RUN useradd -m $USER && \
    echo "$USER:$USER" | chpasswd && \
    usermod --shell /bin/bash $USER && \
    usermod -aG sudo $USER && \
    usermod -aG video $USER && \
    usermod -aG dialout $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USER && \
    chmod 0440 /etc/sudoers.d/$USER && \
    usermod  --uid $UID $USER && \
    groupmod --gid $GID $USER

# Install GTest/GMonk
RUN cd /usr/src/googletest && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make install -j$(nproc --all)

# Install Ceres (pulled from googlecartographer)
ARG CERES_SOLVER_VERSION="1.13.0"
RUN git clone https://ceres-solver.googlesource.com/ceres-solver && \
    cd ceres-solver && \
    git checkout tags/${CERES_SOLVER_VERSION} && \
    mkdir build && \
    cd build && \
    cmake .. -G Ninja -DCXX11=ON && \
    ninja && \
    CTEST_OUTPUT_ON_FAILURE=1 ninja test && \
    ninja install && \
    cd ../.. && \
    rm -rf ceres-solver

# Install proto3 (pulled from googlecartographer)
ARG PROTOBUF_VERSION="v3.4.1"
RUN git clone https://github.com/google/protobuf.git && \
    cd protobuf && \
    git checkout tags/${PROTOBUF_VERSION} && \
    mkdir build && \
    cd build && \
    cmake -G Ninja \
      -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
      -DCMAKE_BUILD_TYPE=Release \
      -Dprotobuf_BUILD_TESTS=OFF \
      ../cmake && \
    ninja && \
    ninja install && \
    cd ../.. && \
    rm -rf protobuf

# Install OR-Tools
#ARG OR_TOOL_VERSION="v7.1"
#RUN git clone https://github.com/google/or-tools.git && \
#    cd or-tools && \
#    git checkout tags/${OR_TOOL_VERSION} && \
#    make cc && \
#    make test_cc && \
#    make install_cc \
#    cd ../.. && \
#    rm -rf or-tools

# Dependencies for google cartographer
RUN apt-get update && \
    apt-get install -y \
      clang \
      g++ \
      libcairo2-dev \
      libcurl4-openssl-dev \
      liblua5.2-dev \
      python-sphinx && \
    rm -rf /var/lib/apt/lists/*

# Dependcies for ROS2
RUN sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list' && \
    apt-get update && \
    apt-get install -y locales curl gnupg2 lsb-release && \
    locale-gen en_US en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    curl http://repo.ros2.org/repos.key | sudo apt-key add - && \
    export CHOOSE_ROS_DISTRO=crystal && \
    apt-get update && \
    apt-get install -y ros-$CHOOSE_ROS_DISTRO-desktop ros-$CHOOSE_ROS_DISTRO-ros1-bridge python3-argcomplete && \
    rm -rf /var/lib/apt/lists/*

# For Android development
RUN apt-get update && \
    apt-get install -y \
      android-tools-adb \
      android-tools-fastboot \
      bison \
      dpkg-dev \
      flex \
      g++-multilib \
      gnupg \
      gperf \
      lib32ncurses5-dev \
      lib32z1 \
      lib32z1-dev \
      libc6-dev \
      libgl1-mesa-dev \
      liblz4-tool \
      libbz2-dev \
      libbz2-1.0 \
      libghc-bzlib-dev \
      libx11-dev \
      libxml2-utils \
      maven \
      optipng \
      pngcrush \
      python \
      python-mako \
      python-markdown \
      python3 \
      python3-mako \
      repo \
      schedtool \
      software-properties-common \
      squashfs-tools \
      syslinux-utils \
      tofrodos \
      x11proto-core-dev \
      xsltproc \
      zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# For radar
RUN apt-get update && \
    apt-get install -y ros-melodic-socketcan-bridge && \
    rm -rf /var/lib/apt/lists/*

# For GPS
RUN apt-get update && \
    apt-get install -y \
      gpsd \
      gpsd-clients \
      libgps-dev \
      ros-melodic-nmea-navsat-driver \
      ros-melodic-gpsd-client \
      ros-melodic-gps-common && \
    sed -ri 's/ATTRS\{idVendor\}==\"1546\", ATTRS\{idProduct\}==\"01a8\"/#ATTRS\{idVendor\}==\"1546\", ATTRS\{idProduct\}==\"01a8\"/g' /lib/udev/rules.d/60-gpsd.rules && \
    rm -rf /var/lib/apt/lists/*

# For Velodyne
RUN apt-get update && \
    apt-get install -y libpcap-dev ros-melodic-velodyne && \
    rm -rf /var/lib/apt/lists/*

# Install gdb
RUN apt-get update && \
    apt-get install -y gdb && \
    echo "kernel.yama.ptrace_scope = 0" > /etc/sysctl.d/10-ptrace.conf && \
    rm -rf /var/lib/apt/lists/*

# Install openssh
RUN apt-get update && \
    apt-get install -y openssh-server net-tools && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /var/run/sshd && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    echo X11UseLocalhost no >> /etc/ssh/sshd_config

# Install wstool and rosdep
RUN apt-get update && \
    apt-get install -y python-wstool python-rosdep ninja-build && \
    rm -rf /var/lib/apt/lists/*

# Install LpSensor driver
RUN apt-get update && \
    apt install -y libbluetooth-dev wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://bitbucket.org/lpresearch/openmat/downloads/LpSensor-1.3.5-Linux-x86-64.tar.gz && \
    tar xzf LpSensor-1.3.5-Linux-x86-64.tar.gz && \
    dpkg -i LpSensor-1.3.5-Linux-x86-64/*.deb && \
    rm -rf LpSensor-1.3.5-Linux-x86-64 LpSensor-1.3.5-Linux-x86-64.tar.gz

# Install clang-format
RUN apt-get update && \
    apt-get install -y clang-format && \
    rm -rf /var/lib/apt/lists/*

# Install common used utils (from education-common meta-package)
RUN apt-get update && \
    apt-get install -y apt-listchanges bash-completion bc bind9-host cfengine2 cifs-utils command-not-found convmv cups cups-browsed debconf-utils debian-archive-keyring deborphan dhcping dmidecode eject etherwake ethtool finger foomatic-db foomatic-db-engine fping gdb hddtemp hdparm hpijs-ppds hplip htop hwinfo iftop iotop iproute2 less libnss-myhostname libpam-tmpdir libwww-perl lshw lsscsi man-db manpages mc memtest86+ mlocate mtools mtr ncftp nictools-pci nmap nullidentd openbsd-inetd openssh-client pciutils printer-driver-hpijs printer-driver-pnm2ppa procinfo psmisc python-gtk2 python-vte reportbug rsync rsyslog screen strace sysfsutils tcpdump tcptraceroute traceroute unattended-upgrades valgrind vim wget && \
    rm -rf /var/lib/apt/lists/*

# Install development utils
RUN apt-get update && \
    apt-get install -y can-utils dbus-x11 debian-goodies gtk-recordmydesktop htop iputils-ping ipython ipython3 jq \
    keychain less \
    meld moreutils nfs-common openbox pcl-tools psmisc python-pip python-pudb python3-pip python3-pudb \
    screen shellcheck silversearcher-ag tig tmux tree vim virtualenv v4l-utils \
    vlc x11-apps x11-xserver-utils xcompmgr xvfb zsh && \
    pip3 install awscli && \
    pip3 install pycodestyle && \
    pip3 install yapf && \
    pip install scipy scikit-learn && \
    rm -rf /var/lib/apt/lists/*

# Install ros development utils
RUN apt-get update && \
    apt-get install -y python-catkin-tools python3-vcstool && \
    rm -rf /var/lib/apt/lists/*

# Build google test, this might not be best practice
# TODO: remove the pre-built gtest
RUN cd /usr/src/gtest/ && \
    cmake CMakeLists.txt && \
    make && \
    make install


USER $USER

# nvidia-container-runtime
#ENV NVIDIA_VISIBLE_DEVICES \
#    ${NVIDIA_VISIBLE_DEVICES:-all}
#ENV NVIDIA_DRIVER_CAPABILITIES \
#    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics
