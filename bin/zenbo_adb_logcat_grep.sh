#!/bin/bash

adb logcat | \
  grep -v RealSense | \
  grep -v realsenseSDK | \
  grep -v GraphicBufferMapper | \
  grep -v ImageCallbackMonitor | \
  grep -v chatty | \
  grep -v WideKeyFrameBuilder | \
  grep -v Audio | \
  grep -E $1
