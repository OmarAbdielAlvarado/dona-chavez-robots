#!/bin/bash
pkill -f gz-sim-main; pkill -f gz-sim-gui
pkill -f gz_tools_vendor/bin/gz
pkill -f parameter_bridge
pkill -f "ros2 launch turtlebot3_gazebo"
pkill -f robot_state_publisher; pkill -f nodo_comi_autonomo; pkill -f rviz2
sleep 1
pgrep -af "gz-sim|gz_tools|parameter_bridge|turtlebot3_gazebo|nodo_comi|rviz2" || echo "TODO DETENIDO"
