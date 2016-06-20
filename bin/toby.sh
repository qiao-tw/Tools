#!/bin/bash

adb root 
adb shell chmod 777 /dev/ttyACM0
adb shell setenforce 0

