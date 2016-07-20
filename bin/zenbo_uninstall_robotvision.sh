#!/bin/sh
adb remount
adb shell rm -r /system/app/RobotVisionService
adb shell rm -r /system/app/TestVisoinApp
echo "Now, you can install RobotVisionService.apk and TestVisoinApp.apk again"
