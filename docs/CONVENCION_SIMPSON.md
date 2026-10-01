# Convención legal-demo (protegida, no infringe derechos)
- NOMBRES: personaje cortado + apellido mexicano → "Homero Simp-González",
  "Bob Pat-Chávez", "Barney Go-Meléndez". NUNCA el nombre completo real.
- CALLES: palabras-vivas estilo "Avenida Siempre Viva", "Cerrada Xochitl-742".
  NUNCA toponimia real de Colima.
- CAPA REAL (invisible al demo): coordenadas/duraciones/distancias REALES
  (QSoy2 geo + nominatim local). Un ingeniero lo confirma.
- CAPA FICTICIA (visible): nombres de clientes/calles/locales del universo
  Simpson-mexicano. Conmutables: overlay ON = demo, OFF = producción real.
- BASES robots: las 2 cadenas reales (BURGUER 1/2) — ancla geográfica verdadera.
- Clientes: domicilios públicos renombrados (casa de Apu = tienda real de esquina).
## PLAN ROBOTS (1-oct)
- Video: el dibujo PIL se reemplaza por animacion 2D por capas o sprite IA local (venv).
- Personaje: "Barto Simp-R" moreno, camiseta naranja, pizarra EL BARTO.MEX. NO copia Fox.
- Hardware/Plataforma: ROS2 (simulacion Gazebo) como base tecnica propia; Kiwibot como
  flota real en MX (API terceros, capa accesible = nuestro negocio); Starship/Serve NO
  (cerrados). Fase 2: Jetson + chasis generico (financiable NVIDIA grant).
- Nombre producto: COMI-COLIMA (antes Doña Chavez).
- Plan hardware barato/conflicto-cero: chasis AGV chino (dif-drive, $300-800 USD Alibaba)
  + Jetson Orin Nano (~$249, grant) + RPLidar A1 (~$99) = control TOTAL, ROS2, pintable
  con colores de la empresa contratante. Filosofia Vemos: camara barata + software propio.
  Kiwibot = via realista MX (flota ajena + nuestra capa accesible). Esperando JSON ballena.
- DECISION ROBOT (datos ballena 1-oct): Kiwibot unica flota ajena viable (API si,
  $2200/mes, MX por confirmar). Robot propio: Jetson Orin Nano $669 + RPLidar $99 +
  chasis dif-drive ~$400 = ~$1168 USD/unidad, ROS2, control total, pintable.
  Starship/Serve = cerrados (solo referencia de mercado). Presupuesto 2 robots demo ≈ $2336.
## RUTA SIN RENTA (opinion razonada 1-oct)
- FASE 0 (hoy, $0): ROS2 Humble + Gazebo en la PC — navegar TurtleBot3 simulado,
  nuestra capa de voz (espeak) y geo real Colima. Cero hardware.
- FASE 1 ($1,168): 1 robot propio (Orin Nano+RPLidar+chasis) — pruebas de calle reales.
- FASE 2 ($1,168): robot 2 = demo con cliente (2 unidades: uno muere, demo sigue).
- Kiwibot = opcion B SOLO si un cliente exige velocidad inmediata ($2200/mes, flota ajena).
- Fondeo fase 1-2: NVIDIA Inception (credibilidad+creditos) -> 2GI 2027 ($10K) o GDF.
- Nunca renta mensual: propiedad total o nada (filosofia Vemos aplicada a robots).
## GPU WORKSTATION (opinion 1-oct)
- AMD(Intel) fuera: rompen CUDA/Jetson/ROS2 = rompen historia NVIDIA grant.
- Lista ballena: RTX 4090 usada ~$2200-2400 = mejor opcion NVIDIA listada.
- ORDEN: Fase 0 sim ($0) -> robot 1 ($1168) -> GPU al final (si grant sobra).
- Justificacion grant de la GPU: entrenar/probar modelos que corren en Jetson.
- PENDIENTE ballena: precio RTX 3090 usada 24GB (costo-efectivo para LLM local).
## HARDWARE FINAL (decision Omar 1-oct)
- GPU: RTX 3090 usada 24GB ($750-1050 eBay / ~$1150 ML MX) = eleccion costo-efectivo.
  NO lealtad a NVIDIA: si no patrocina, se va con AMD/ROCm o Intel Arc B60 ($700, 24GB).
  Prioridad: que corra LO QUE YA TENGO (AGP, modelos locales) y control total.
- RAM: 32GB actuales -> objetivo 48GB+ (modulo adicional) para LLM local + ROS2+Gazebo.
- Presupuesto grant total: 2 robots (~$2336) + GPU 3090 usada (~$1050) + RAM (~$150)
  = ~$3536 USD. Todo propiedad de Omar, cero renta mensual.
- Mostrar lo hecho: no proyecto nuevo sino MEJORA de lo existente (Vemos, QSoy2,
  COMI-COLIMA). El pitch es evolucion, no promesa.
