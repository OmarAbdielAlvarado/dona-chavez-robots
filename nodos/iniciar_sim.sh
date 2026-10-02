#!/bin/bash
cd "$(dirname "$0")"
./detener_sim.sh >/dev/null 2>&1
source /opt/ros/lyrical/setup.bash
export TURTLEBOT3_MODEL=burger GZ_IP=127.0.0.1 IGN_IP=127.0.0.1
export GZ_SIM_RESOURCE_PATH=/opt/ros/lyrical/share/turtlebot3_gazebo/models:${GZ_SIM_RESOURCE_PATH}

# FIX v4: --force-version 10 (el wrapper se cuelga sin el) + chequeo por LOG
nohup gz sim --force-version 10 -r -s -v2 /opt/ros/lyrical/share/turtlebot3_gazebo/worlds/turtlebot3_world.world >/tmp/gz_server.log 2>&1 &
GZPID=$!

LISTO=0
for i in $(seq 1 30); do
  grep -q "Serving world names" /tmp/gz_server.log && { LISTO=1; break; }
  if ! kill -0 $GZPID 2>/dev/null; then
    echo "== SERVIDOR GZ MURIO. Log: =="; tail -15 /tmp/gz_server.log; exit 1
  fi
  sleep 1
done
[ $LISTO -eq 0 ] && { echo "== TIMEOUT. Log: =="; tail -15 /tmp/gz_server.log; exit 1; }
echo "== SERVIDOR GZ VIVO (pid $GZPID) =="

nohup ros2 launch turtlebot3_gazebo robot_state_publisher.launch.py >/tmp/rsp.log 2>&1 &
sleep 3

SPAWN=0
for i in 1 2 3; do
  if ros2 run ros_gz_sim create -name burger -file /opt/ros/lyrical/share/turtlebot3_gazebo/models/turtlebot3_burger/model.sdf -x 0 -y 0 -z 0.01; then SPAWN=1; break; fi
  echo "intento $i fallo, reintentando..."; sleep 3
done
[ $SPAWN -eq 1 ] && echo "SPAWN OK" || { echo "== SPAWN FALLO. Log: =="; tail -15 /tmp/gz_server.log; }

nohup ros2 run ros_gz_bridge parameter_bridge --ros-args -p config_file:=/opt/ros/lyrical/share/turtlebot3_gazebo/params/turtlebot3_burger_bridge.yaml >/tmp/bridge.log 2>&1 &
sleep 2
echo "== MUNDO LISTO. Terminal libre =="
