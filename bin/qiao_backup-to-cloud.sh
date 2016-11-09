#!/bin/bash

PROJECT_DIR=${HOME}/projects
ROBOTVISIONLIB_DIR=${PROJECT_DIR}/robotvisionlib
ROBOTVISIONAPP_DIR=${PROJECT_DIR}/robotvisionapp
QIAO_BIN_DIR=${HOME}/Tools/bin

cd ${ROBOTVISIONLIB_DIR}
git stash clear
git stash save
git push gitlab --all --force
git stash pop

cd ${ROBOTVISIONAPP_DIR}
git stash clear
git stash save
git push gitlab --all --force
git stash pop

cd ${QIAO_BIN_DIR}
git stash clear
git stash save
git push --all --force
git stash pop
