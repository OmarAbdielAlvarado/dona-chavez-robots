#!/bin/bash
cd "$(dirname "$0")"
source /opt/ros/lyrical/setup.bash
export TURTLEBOT3_MODEL=burger GZ_IP=127.0.0.1 IGN_IP=127.0.0.1
export GZ_SIM_RESOURCE_PATH=/opt/ros/lyrical/share/turtlebot3_gazebo/models:${GZ_SIM_RESOURCE_PATH}

# 1) SERVIDOR GZ
if pgrep -f gz-sim-main >/dev/null; then
  echo "[OK] servidor gz vivo"
else
  echo "[..] servidor muerto -> arrancando"
  nohup stdbuf -oL -eL gz sim --force-version 10 -r -s -v2 /opt/ros/lyrical/share/turtlebot3_gazebo/worlds/turtlebot3_world.world >/tmp/gz_server.log 2>&1 &
  sleep 10
  pgrep -f gz-sim-main >/dev/null && echo "[OK] servidor arrancado" || { echo "[X] no arranco:"; tail -10 /tmp/gz_server.log; exit 1; }
fi

# 2) BURGER (verdad por contenido de poses, no por memoria)
if timeout 4 gz topic -e -t /world/default/dynamic_pose/info -n 1 2>/dev/null | grep -qi "burger"; then
  echo "[OK] burger ya esta en el mundo"
else
  echo "[..] spawn burger..."
  ros2 run ros_gz_sim create -name burger -file /opt/ros/lyrical/share/turtlebot3_gazebo/models/turtlebot3_burger/model.sdf -x 0 -y 0 -z 0.01
fi

# 3) ROBOT_STATE_PUBLISHER
if pgrep -f robot_state_publisher >/dev/null; then echo "[OK] robot_state_publisher vivo"; else
  nohup ros2 launch turtlebot3_gazebo robot_state_publisher.launch.py >/tmp/rsp.log 2>&1 &
  sleep 2; echo "[..] robot_state_publisher arrancado"
fi

# 4) PUENTE
if pgrep -f parameter_bridge >/dev/null; then echo "[OK] puente vivo"; else
  nohup stdbuf -oL -eL ros2 run ros_gz_bridge parameter_bridge --ros-args -p config_file:=/opt/ros/lyrical/share/turtlebot3_gazebo/params/turtlebot3_burger_bridge.yaml >/tmp/bridge.log 2>&1 &
  sleep 2; echo "[..] puente arrancado"
fi

# 5) VEREDICTO: ¿llegan datos de laser a ROS?
sleep 2
if timeout 5 ros2 topic echo /scan --once 2>/dev/null | grep -q "ranges"; then
  echo "==== TODO OPERATIVO: el demo puede correr ===="
else
  echo "==== [X] sin /scan. Ultimas lineas de logs:"; tail -5 /tmp/gz_server.log /tmp/bridge.log
fi
