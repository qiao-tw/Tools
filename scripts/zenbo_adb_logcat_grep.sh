#!/bin/bash

adb logcat | \
  grep -v RealSense | \
  grep -v realsenseSDK | \
  grep -v GraphicBufferMapper | \
  grep -v ImageCallbackMonitor | \
  grep -v chatty | \
  grep -v WideKeyFrameBuilder | \
  grep -v Audio | \
  grep -v AppOpsStatusUpdateHandler | \
  grep -v ProcStatsManager | \
  grep -v InputDispatcher | \
  grep -v ufoEGL | \
  grep -E $1
