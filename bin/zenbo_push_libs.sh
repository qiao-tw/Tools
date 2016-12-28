#!/bin/bash

adb remount
adb push ./install/android/libs/x86/libzenbocv.so /system/lib/
adb push ./install/android/libs/x86/libjni_zenbocv.so /system/lib/
adb push ./install/android/libs/x86_64/libzenbocv.so /system/lib64/
adb push ./install/android/libs/x86_64/libjni_zenbocv.so /system/lib64/
echo 'end pushing to /system partition on your device'
