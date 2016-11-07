#!/bin/bash

OPENGROK_SRC_DIR=/var/opengrok/src
ROBOTVISIONLIB_DIR=${OPENGROK_SRC_DIR}/RobotVisionLib
ROBOTVISIONAPP_DIR=${OPENGROK_SRC_DIR}/RobotVisionApp
ROBOTFRAMEWORK_DIR=${OPENGROK_SRC_DIR}/RobotFramework
MOTIONSERVICE_DIR

cd ${ROBOTVISIONLIB_DIR}
git stash clear
git stash save
git checkout develop
git fetch origin
git rebase origin/develop
git stash pop

cd ${ROBOTVISIONAPP_DIR}
git stash clear
git stash save
git checkout develop
git fetch origin
git rebase origin/develop
git stash pop

cd ${ROBOTFRAMEWORK_DIR}
git stash clear
git stash save
git checkout master
git fetch origin
git rebase origin/master
git stash pop

cd ${MOTIONSERVICE_DIR}
git stash clear
git stash save
git fetch origin
git rebase origin/m-mr1-r2_cht_hr-dev
git stash pop
