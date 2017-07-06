#!/bin/bash

PROJECT_DIR=${HOME}/projects
ROBOTVISIONLIB_DIR=${PROJECT_DIR}/robotvisionlib
ROBOTVISIONSRV_DIR=${PROJECT_DIR}/robotvisionservice
ROBOTTRANSFORM_DIR=${PROJECT_DIR}/transformation
ROBOTVISIONOPS_DIR=${PROJECT_DIR}/cv_devops
ROBOTFRAMEWORK_DIR=${PROJECT_DIR}/robotframework

QIAO_BIN_DIR=${HOME}/Tools/bin

cd ${ROBOTVISIONLIB_DIR}
git stash clear
git stash save
git push gitlab --all --force
git stash pop

cd ${ROBOTVISIONSRV_DIR}
git stash clear
git stash save
git push gitlab --all --force
git stash pop

cd ${ROBOTTRANSFORM_DIR}
git stash clear
git stash save
git push gitlab --all --force
git stash pop

cd ${ROBOTVISIONOPS_DIR}
git stash clear
git stash save
git push gitlab --all --force
git stash pop

cd ${ROBOTFRAMEWORK_DIR}
git stash clear
git stash save
git push gitlab --all --force
git stash pop

cd ${QIAO_BIN_DIR}
git stash clear
git stash save
git push --all --force
git stash pop
