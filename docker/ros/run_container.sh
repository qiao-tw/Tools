socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
xhost + local:root
docker run -it \
    -e DISPLAY=$(ipconfig getifaddr en0):0 \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    osrf/ros:indigo-desktop-full #\
    #    --env="QT_X11_NO_MITSHM=1" \
#    rqt
