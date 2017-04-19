#!/bin/bash

OPENGROK_SRC_DIR=/var/opengrok/src
ROBOTVISIONLIB_DIR=${OPENGROK_SRC_DIR}/RobotVisionLib
ROBOTVISIONAPP_DIR=${OPENGROK_SRC_DIR}/RobotVisionApp
ROBOTFRAMEWORK_DIR=${OPENGROK_SRC_DIR}/RobotFramework

cd ${ROBOTVISIONLIB_DIR}
git fetch origin
git checkout develop
git rebase origin/develop

cd ${ROBOTVISIONAPP_DIR}
git fetch origin
git checkout develop
git rebase origin/develop

cd ${ROBOTFRAMEWORK_DIR}
git fetch origin
git checkout master
git rebase origin/master

