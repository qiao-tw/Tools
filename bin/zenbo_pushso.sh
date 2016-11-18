#!/bin/bash

PROJECT_DIR=${HOME}/projects
ROBOTVISIONLIB_DIR=${PROJECT_DIR}/robotvisionlib

cd ${ROBOTVISIONLIB_DIR}
adb remount
adb push install/android/libs/x86/libzenbocv.so /system/lib/
adb push install/android/libs/x86/libjni_zenbocv.so /system/lib/
adb push install/android/libs/x86_64/libzenbocv.so /system/lib64/
adb push install/android/libs/x86_64/libjni_zenbocv.so /system/lib64/
echo 'end pushing to /system partition on your device'
