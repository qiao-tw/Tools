#!/bin/bash

MOUNT_DIR=${HOME}/mnt/RTimage
REMOTE_DIR=//corpnet.asus/asusfs/RTimage

sudo mount.cifs -v ${REMOTE_DIR} ${MOUNT_DIR} -o user=QianHao_Huang,pass=@sus123456,dom=asus
