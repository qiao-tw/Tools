#!/bin/bash

#set -o errexit
#set -o verbose

PROJECT_DIR=${HOME}/Projects
ROBOTVISIONLIB_DIR=${PROJECT_DIR}/RobotVisionLib
ROBOTVISIONSRV_DIR=${PROJECT_DIR}/RobotVisionService
ROBOTTRANSFORM_DIR=${PROJECT_DIR}/Transformation
ROBOTVISIONOPS_DIR=${PROJECT_DIR}/cv_devops
ROBOTFRAMEWORK_DIR=${PROJECT_DIR}/davinci_robot_framework
ROBOTMOTIONSRV_DIR=${PROJECT_DIR}/davinci_robot_motionservice

if [ -d ${ROBOTVISIONLIB_DIR} ] ; then
  cd ${ROBOTVISIONLIB_DIR}
  git stash clear
  git stash save
  git checkout master
  git pull origin master --rebase
  git checkout develop
  git pull origin develop --rebase
  git stash pop
fi

if [ -d ${ROBOTVISIONSRV_DIR} ] ; then
  cd ${ROBOTVISIONSRV_DIR}
  git stash clear
  git stash save
  git checkout master
  git pull origin master --rebase
  git checkout develop
  git pull origin develop --rebase
  git stash pop
fi


if [ -d ${ROBOTFRAMEWORK_DIR} ] ; then
  cd ${ROBOTFRAMEWORK_DIR}
  git stash clear
  git stash save
  git fetch origin
  git checkout m-mr1-r2_cht_hr-r5
  git rebase origin/m-mr1-r2_cht_hr-r5
  git checkout m-mr1-r2_cht_hr-r6
  git rebase origin/m-mr1-r2_cht_hr-r6
  git stash pop
fi


if [ -d ${ROBOTTRANSFORM_DIR} ] ; then
  cd ${ROBOTTRANSFORM_DIR}
  git stash clear
  git stash save
  git fetch origin
  git checkout master
  git rebase origin/master
  git checkout develop
  git rebase origin/develop
  git stash pop
fi

if [ -d ${ROBOTVISIONOPS_DIR} ] ; then
  cd ${ROBOTVISIONOPS_DIR}
  git stash clear
  git stash save
  git fetch origin
  git checkout master
  git rebase origin/master
  git stash pop
fi

if [ -d ${ROBOTMOTIONSRV_DIR} ] ; then
  cd ${ROBOTMOTIONSRV_DIR}
  git stash clear
  git stash save
  git fetch origin
  git checkout m-mr1-r2_cht_hr-dev
  git rebase origin/m-mr1-r2_cht_hr-dev
  git stash pop
fi
