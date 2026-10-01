1-oct: convencion Simpson escrita (docs/CONVENCION_SIMPSON.md) + overlay JSON esqueleto.
Prompt para la ballena listo — Omar lo pega, JSON resultante va a springfield_overlay.json.
1-oct(5): capa real Colima descargada (25 negocios OSM, capa_real.json) + overlay 12
Simpson fusionado con anclas reales + BURGUER_1/2 reales. Mapa regenerado con toggle
SPRINGFIELD ON/OFF (ON=demo ficcion, OFF=anclas reales p/ingeniero) y contraste alto.
ROBOTS 1-oct: JSON ballena con fuentes. Kiwibot viable (API, $2200/mes, MX pendiente);
robot propio ~$1168 USD (Orin Nano+RPLidar+chasis) = justifica NVIDIA grant; cerrados:
Starship/Serve. decision_robot.json creado. Videos viejos borrados.
DECISION 1-oct: ruta sin renta = 2 robots propios (~$2336 total) vs Kiwibot $2640/anio.
Fase 0 HOY: ROS2+Gazebo simulacion $0. Fondeo: Inception->2GI/GDF. Kiwibot solo plan B.
GPU 1-oct: decision = NVIDIA solo, 4090 usada mejor de la lista, PERO orden es
sim->robot->GPU. 3090 usada 24GB pendiente de cotizar con ballena. AMD/Intel descartados.
HARDWARE CIERRE 1-oct: 3090 usada 24GB elegida ($750-1050), sin lealtad NVIDIA
(AMD/B60 alternativas reales). RAM 48GB objetivo. Presupuesto total grant ~$3536 USD:
2 robots + GPU + RAM, propiedad total. Pitch = mejorar lo existente, no proyecto nuevo.
FASE 0 INICIADA 1-oct 16:40: ROS2 Lyrical Leo instalado (ros-base + dev-tools,
~2GB) en Ubuntu 26.04 resolute. setup.bash en .bashrc. Prueba talker/listener en curso.
Siguiente: Gazebo sim (turtlebot3) + capa voz COMI-COLIMA sobre topicos ROS2.
FASE 0 COMPLETA 1-oct 17:20: ROS2 Lyrical Leo OK. Talker->topic echo CONFIRMADO
(data: Hello World: 5) con ROS_LOCALHOST_ONLY=1 + DOMAIN_ID=77 (fijados en .bashrc).
Hardware verificado: Ryzen Phoenix 12 hilos, 30GB RAM, RTX 5060 Ti 16GB (driver 580),
NVMe 1TB + 500GB + pendrive 115G. La GPU local entrena; Jetson despliega (pitch).
SIGUIENTE SESION: Gazebo + TurtleBot3 (~2GB) y robot virtual recibe capa voz COMI-COLIMA.
