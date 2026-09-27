# Doña Chávez 🤖🇲🇽
Robots repartidores de comida con seguimiento GPS en vivo por el dueño. DEMO 100% ficticia (clientes SIM, teléfonos 555).

Para qué puede servir: el CSV demo y el flujo son reutilizables por organismos tipo RPP en México para dar mejor atención al usuario (mapear domicilios y rutas con datos controlados).

## Estructura
- 1_scripts_core/ (bot y servidor de rutas — en integración)
- 2_datos_demo/clientes_demo_v2.csv (clientes + 2 BASES: pinzar coordenadas reales desde Maps)
- 3_mapa/mapa_donachavez.html (mapa Mex-SIM: azul=cliente, rojo=base)
- docs/ROADMAP.md · archivados/

## Roadmap
- FASE A: dirección del cliente -> coordenada (geocoding sobre CSV)
- FASE B: pedido -> robot -> GPS en vivo visible por el dueño (seguridad)
- FASE C: aviso al cliente "2 min antes" con ubicación del robot
- FASE D (compromiso social): el operador que despacha/las robots desde el software es una PERSONA CON DISCAPACIDAD — empleo real usando nuestro software
