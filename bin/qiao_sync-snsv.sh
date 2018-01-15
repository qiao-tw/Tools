#!/bin/bash

set -e

PROJECT_DIR=${HOME}/Projects
ROBOTVISIONLIB_DIR=${PROJECT_DIR}/RobotVisionLib
ROBOTVISIONSRV_DIR=${PROJECT_DIR}/RobotvisionService
ROBOTTRANSFORM_DIR=${PROJECT_DIR}/Transformation
ROBOTVISIONOPS_DIR=${PROJECT_DIR}/cv_devops
ROBOTFRAMEWORK_DIR=${PROJECT_DIR}/davinci_robot_framework
ROBOTMOTIONSRV_DIR=${PROJECT_DIR}/davinci_robot_motionservice

cd ${ROBOTVISIONLIB_DIR}
git stash clear
git stash save
git fetch origin
git checkout master
git rebase origin/master
git checkout develop
git rebase origin/develop
git stash pop

cd ${ROBOTVISIONSRV_DIR}
git stash clear
git stash save
git fetch origin
git checkout master
git rebase origin/master
git checkout develop
git rebase origin/develop
git stash pop

cd ${ROBOTFRAMEWORK_DIR}
git stash clear
git stash save
git fetch origin
git checkout m-mr1-r2_cht_hr-r6
git rebase origin/m-mr1-r2_cht_hr-r6
git stash pop

cd ${ROBOTTRANSFORM_DIR}
git stash clear
git stash save
git fetch origin
git checkout master
git rebase origin/master
git checkout develop
git rebase origin/develop
git stash pop

cd ${ROBOTVISIONOPS_DIR}
git stash clear
git stash save
git fetch origin
git checkout master
git rebase origin/master
git checkout develop
git rebase origin/develop
git stash pop

cd ${ROBOTMOTIONSRV_DIR}
git stash clear
git stash save
git fetch origin
git checkout m-mr1-r2_cht_hr-dev
git rebase origin/m-mr1-r2_cht_hr-dev
git stash pop
