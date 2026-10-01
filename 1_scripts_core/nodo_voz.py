#!/usr/bin/env python3
# COMI-COLIMA: nodo voz — el robot anuncia estados en español (accesibilidad)
import rclpy, subprocess
from rclpy.node import Node
from std_msgs.msg import String
class Voz(Node):
    def __init__(self):
        super().__init__('voz_comicolima')
        self.create_subscription(String, 'pedido', self.habla, 10)
    def habla(self, m):
        self.get_logger().info(f"HABLANDO: {m.data}")
        subprocess.run(['espeak-ng','-v','es','-s','155', m.data], check=False)
def main():
    rclpy.init(); n=Voz()
    try: rclpy.spin(n)
    finally: n.destroy_node(); rclpy.shutdown()
if __name__=='__main__': main()
