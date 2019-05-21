#!/bin/bash

adb root
adb wait-for-devices
adb disable-verity
adb reboot
adb wait-for-devices
adb root
adb wait-for-devices
adb remount
