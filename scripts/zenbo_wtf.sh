#!/bin/bash

grep -rnE $1 $2 | \
  grep -v RealSense | \
  grep -v realsenseSDK | \
  grep -v GraphicBufferMapper | \
  grep -v ImageCallbackMonitor | \
  grep -v chatty | \
  grep -v WideKeyFrameBuilder | \
  grep -v Audio
