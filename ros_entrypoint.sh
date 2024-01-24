#!/bin/bash
set -e

id -u ros &>/dev/null || adduser --quiet --disabled-password --gecos '' --uid ${UID:=1000} --uid ${GID:=1000} ros

getent group i2c || groupadd -g 998 i2c
getent group gpio || groupadd -g 997 gpio
usermod -aG i2c ros
usermod -aG gpio ros

source /opt/ros/${ROS_DISTRO}/setup.bash
source /colcon_ws/install/setup.bash

exec "$@"