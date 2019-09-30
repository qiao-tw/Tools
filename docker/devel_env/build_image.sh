#!/bin/sh

set -o errexit
set -o verbose

# CERES_SOLVER_VERSION="1.13.0"
# if [ -d "ceres-solver" ]; then
#     (cd ceres-solver; git checkout tags/${CERES_SOLVER_VERSION})
# else
#     git clone https://ceres-solver.googlesource.com/ceres-solver
# fi
#
# PROTOBUF_VERSION="v3.4.1"
# if [ -d "protobuf" ]; then
#     (cd protobuf; git checkout tags/${PROTOBUF_VERSION})
# else
#     git clone https://github.com/google/protobuf.git
# fi

docker build                          \
  -t devel-env                        \
  --build-arg USER=$USER              \
  --build-arg UID=$(id -u)            \
  --build-arg GID=$(id -g)            \
  --build-arg OS_TYPE=$(shell uname)  \
  .
