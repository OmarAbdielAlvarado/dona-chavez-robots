#!/bin/bash
source /opt/ros/lyrical/setup.bash
export TURTLEBOT3_MODEL=burger
export GZ_IP=127.0.0.1
export IGN_IP=127.0.0.1

gz sim -r -s -v2 /opt/ros/lyrical/share/turtlebot3_gazebo/worlds/turtlebot3_world.world &
sleep 8

ros2 launch turtlebot3_gazebo robot_state_publisher.launch.py &
sleep 3

ros2 run ros_gz_sim create -name burger -file /opt/ros/lyrical/share/turtlebot3_gazebo/models/turtlebot3_burger/model.sdf -x 0 -y 0 -z 0.01

ros2 run ros_gz_bridge parameter_bridge --ros-args -p config_file:=/opt/ros/lyrical/share/turtlebot3_gazebo/params/turtlebot3_burger_bridge.yaml &
sleep 2
echo "== MUNDO LISTO =="
wait
