#!/bin/bash

PROJECT_DIR=${HOME}/projects
ROBOTVISIONLIB_DIR=${PROJECT_DIR}/robotvisionlib
ROBOTVISIONAPP_DIR=${PROJECT_DIR}/robotvisionapp

REMOTE_RTIMAGE_DIR=${HOME}/mnt/RTimage

#smbclient //corpnet.asus/asusfs -A ~/Tools/dot_files/smb.auth -c 'cd "RTimage/log/Localization Camp/cv_localization_localbuild" ; put /home/qiao/projects/robotvisionlib/install/android/libs/x86_64/libjni_zenbocv.so x86_64\libjni_zenbocv.so'
smbclient //corpnet.asus/asusfs -A ~/Tools/dot_files/smb.auth -c 'cd "RTimage/log/Localization Camp/cv_localization_localbuild" ; dir ; put /home/qiao/projects/robotvisionapp/RobotVisionService/build/outputs/apk/RobotVisionService-debug.apk RobotVisionService\RobotVisionService-debug.apk'
#sudo rsync -rRvulh --progress --no-implied-dirs --times ${ROBOTVISIONLIB_DIR}/install/android/libs/x86/libjni_zenbocv.so ${REMOTE_RTIMAGE_DIR}/log/Localization\ Camp/cv_localization_localbuild/x86/
#sudo rsync -rRvulh --progress --no-implied-dirs --times ${ROBOTVISIONLIB_DIR}/install/android/libs/x86/libzenbocv.so ${REMOTE_RTIMAGE_DIR}/log/Localization\ Camp/cv_localization_localbuild/x86/
#sudo rsync -rRvulh --progress --no-implied-dirs --times ${ROBOTVISIONLIB_DIR}/install/android/libs/x86_64/libjni_zenbocv.so ${REMOTE_RTIMAGE_DIR}/log/Localization\ Camp/cv_localization_localbuild/x86_64/
#sudo rsync -rRvulh --progress --no-implied-dirs --times ${ROBOTVISIONLIB_DIR}/install/android/libs/x86_64/libzenbocv.so ${REMOTE_RTIMAGE_DIR}/log/Localization\ Camp/cv_localization_localbuild/x86_64/
#sudo rsync -rRvulh --progress --no-implied-dirs --times ${ROBOTVISIONAPP_DIR}/RobotVisionManager/build/outputs/aar/RobotVisionManager-debug.aar ${REMOTE_RTIMAGE_DIR}/log/Localization\ Camp/cv_localization_localbuild/RobotVisionManager/
#sudo rsync -rRvulh --progress --no-implied-dirs --times ${ROBOTVISIONAPP_DIR}/RobotVisionManager/build/outputs/aar/RobotVisionManager-release.aar ${REMOTE_RTIMAGE_DIR}/log/Localization\ Camp/cv_localization_localbuild/RobotVisionManager/
#sudo rsync -rRvulh --progress --no-implied-dirs --times ${ROBOTVISIONAPP_DIR}/RobotVisionService/build/outputs/apk/RobotVisionService-debug.apk ${REMOTE_RTIMAGE_DIR}/log/Localization\ Camp/cv_localization_localbuild/RobotVisionService/
#sudo rsync -rRvulh --progress --no-implied-dirs --times ${ROBOTVISIONAPP_DIR}/TestApp/build/outputs/apk/TestApp-debug.apk ${REMOTE_RTIMAGE_DIR}/log/Localization\ Camp/cv_localization_localbuild/TestApp/
