# Demo Comi-Colima — voz sobre robot simulado (prototipo)

ROS 2 Lyrical + Gazebo (gz sim) headless + TurtleBot3 burger.
El robot avanza solo, detecta obstaculo a <0.9 m, frena, gira y avisa
por ntfy.sh -> Android (Termux, voz JorgeNeuralMX).

## Uso
    ./iniciar_sim.sh                  # mundo + burger + puente (terminal queda libre)
    rviz2 -d comi.rviz                # visualizacion
    python3 nodo_comi_autonomo.py     # comportamiento autonomo + alerta

    ./detener_sim.sh                  # parar todo
    VOZ_LOCAL=1 python3 nodo_comi_autonomo.py   # voz local adicional (Piper es_MX)

## Notas tecnicas (aprendidas a la mala)
- El wrapper de gz se cuelga sin --force-version 10 en Ubuntu resolute.
- Logs de gz a archivo requieren stdbuf -oL: el buffering fingia timeouts.
- GZ_SIM_RESOURCE_PATH debe apuntar a los modelos o el mundo no resuelve model://.
- Lanzar la GUI de gz con GPU NVIDIA Blackwell: segfault EGL pendiente de fix
  (variables __EGL_VENDOR_LIBRARY_FILENAMES / __GLX_VENDOR_LIBRARY_NAME=nvidia).
