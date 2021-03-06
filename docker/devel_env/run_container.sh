#!/bin/sh

set -o errexit
# Uncomment to debug
set -o verbose

# pulled from gpal/ros_devel/xauth.sh
# Make sure processes in the container can connect to the x server
# Necessary so gazebo can create a context for OpenGL rendering (even headless)

XAUTH=/tmp/.docker.xauth
if [ -d $XAUTH ]
then
    sudo rm -rf $XAUTH
fi

if [ ! -f $XAUTH ]
then
    touch $XAUTH
    xauth_list=$(xauth nlist :0 | head -n 1 | sed -e 's/^..../ffff/')
    if [ ! -z "$xauth_list" ]
    then
        echo $xauth_list | xauth -f $XAUTH nmerge -
    fi
    chmod a+r $XAUTH
fi

XAUTH=/tmp/.docker.xauth
if [ ! -f $XAUTH ]
then
  xauth_list=$(xauth nlist :0 | head -n 1 | sed -e 's/^..../ffff/')
  if [ ! -z "$xauth_list" ]
  then
    echo $xauth_list | xauth -f $XAUTH nmerge -
  else
    touch $XAUTH
  fi
  chmod a+r $XAUTH
fi

# socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
xhost +

IMAGE_NAME=devel-env
CONTAINER_NAME=devel-env
if [ $(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME) ]
then
  docker start $CONTAINER_NAME
  docker attach $CONTAINER_NAME
else
  DOCKER_RUN_PARAMETER_LIST="-it \
    --user $(id -u) \
    --name=$CONTAINER_NAME \
    --tmpfs /tmp:exec \
    -h docker \
    -e DISPLAY \
    -e QT_X11_NO_MITSHM=1 \
    -e XAUTHORITY=$XAUTH \
    -e USER=$USER \
    -v /dataset:/dataset \
    -v /etc/group:/etc/group:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/shadow:/etc/shadow:ro \
    -v /private/etc/sudoers.d:/etc/sudoers.d:ro \
    -v $HOME:/home/$USER \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $XAUTH:$XAUTH \
    -v /dev:/dev \
    --net=host \
    --privileged \
    -d \
    ${IMAGE_NAME} \
    /bin/bash"
    #-e DISPLAY=host.docker.internal:0 \
    #-v "$WORKSPACE_DIR":/home/gpal \
    #-v /etc/localtime:/etc/localtime:ro \
    #-v /run/udev:/run/udev:ro \
  echo $DOCKER_RUN_PARAMETER_LIST
  docker run $DOCKER_RUN_PARAMETER_LIST
  docker exec -it $CONTAINER_NAME /bin/bash
fi
