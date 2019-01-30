function rosd
    docker run --rm --add-host=rpi3.local:(avahi-resolve -n4 rpi3.local | cut -f2) --env DISPLAY --env QT_X11_NO_MITSHM=1 --env ROS_MASTER_URI=http://rpi3.local:11311 --env ROS_HOSTNAME=(hostname) --network host -it -v ~/ros:/root -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" --name ros osrf/ros:indigo-desktop-full
end
