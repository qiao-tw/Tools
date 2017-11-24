#!/bin/bash

PROJECT_DIR=${HOME}/Projects
ROBOTVISIONLIB_DIR=${PROJECT_DIR}/RobotVisionLib
ROBOTVISIONSRV_DIR=${PROJECT_DIR}/RobotVisionService
ROBOTTRANSFORM_DIR=${PROJECT_DIR}/Transformation
ROBOTVISIONOPS_DIR=${PROJECT_DIR}/cv_devops
ROBOTFRAMEWORK_DIR=${PROJECT_DIR}/davinci_robot_framework
ROBOTMOTIONSRV_DIR=${PROJECT_DIR}/davinci_robot_motionservice

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

cd ${ROBOTMOTIONSRV_DIR}
git stash clear
git stash save
git push gitlab --all --force
git stash pop
