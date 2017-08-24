#!/bin/bash

PROJECT_DIR=${HOME}/projects
ROBOTVISIONLIB_DIR=${PROJECT_DIR}/robotvisionlib
ROBOTVISIONSRV_DIR=${PROJECT_DIR}/robotvisionservice
ROBOTTRANSFORM_DIR=${PROJECT_DIR}/transformation
ROBOTVISIONOPS_DIR=${PROJECT_DIR}/cv_devops
ROBOTFRAMEWORK_DIR=${PROJECT_DIR}/robotframework



cd ${ROBOTVISIONLIB_DIR}
git stash clear
git stash save
git fetch origin
git checkout master
git rebase origin/master
git checkout develop
git rebase origin/develop
git checkout craving
git rebase origin/craving
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
git checkout master
git rebase origin/master
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
