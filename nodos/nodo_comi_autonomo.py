#!/usr/bin/env python3
# v2 — sector frontal derivado del propio mensaje (verificado, no asumido)
import os, math, subprocess, urllib.request
import rclpy
from rclpy.node import Node
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import TwistStamped

NTFY = "https://ntfy.sh/comicolima-voz"
MSJ  = "Comi-Colima: obstaculo detectado. Me detengo y maniobro."

class ComiAuto(Node):
    def __init__(self):
        super().__init__("comi_autonomo")
        self.pub = self.create_publisher(TwistStamped, "/cmd_vel", 10)
        self.create_subscription(LaserScan, "/scan", self.cb, 10)
        self.armado = True
        self.get_logger().info("Comi autonomo v2 en linea: vigilando el FRENTE")

    def cb(self, scan):
        n = len(scan.ranges)
        if n < 50 or scan.angle_increment == 0.0:
            return
        i_front = int(round((0.0 - scan.angle_min) / scan.angle_increment))
        i_front = max(0, min(n - 1, i_front))
        w = 20  # ventana ±20 grados alrededor del frente
        seg = scan.ranges[max(0, i_front - w): min(n, i_front + w)]
        frente = [d for d in seg if math.isfinite(d) and d > 0.01]
        dmin = min(frente) if frente else 999.0
        v = TwistStamped()
        v.header.stamp = self.get_clock().now().to_msg()
        v.header.frame_id = "base_link"
        if dmin > 0.9:
            v.twist.linear.x = 0.15
            self.armado = True
        else:
            v.twist.linear.x = 0.0
            v.twist.angular.z = 0.5
            if self.armado:
                self.get_logger().info(f"OBSTACULO a {dmin:.2f} m -> ntfy -> Jorge")
                try:
                    req = urllib.request.Request(NTFY, data=MSJ.encode("utf-8"),
                          headers={"Title": "Comi-Colima", "Tags": "robot,warning"})
                    urllib.request.urlopen(req, timeout=5)
                except Exception as e:
                    self.get_logger().error(f"ntfy fallo: {e}")
                if os.environ.get("VOZ_LOCAL") == "1":
                    subprocess.Popen(
                        "echo '" + MSJ + "' | $HOME/.local/bin/piper -m es_MX-claude-high -f /tmp/comi.wav && aplay -q /tmp/comi.wav",
                        shell=True)
                self.armado = False
        self.pub.publish(v)

def main():
    rclpy.init()
    try: rclpy.spin(ComiAuto())
    except KeyboardInterrupt: pass

if __name__ == "__main__":
    main()
