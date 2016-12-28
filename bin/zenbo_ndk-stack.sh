#!/bin/bash
PROJECT_PATH=${HOME}/projects/robotvisionlib
OBJ_PATH=${PROJECT_PATH}/install/android/obj/local/x86_64
adb logcat | ndk-stack -sym ${OBJ_PATH}
