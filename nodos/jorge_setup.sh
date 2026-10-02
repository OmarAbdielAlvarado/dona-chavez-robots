#!/data/data/com.termux/files/usr/bin/bash
echo "== Jorge setup en el Oppo =="
pkg install -y termux-api python curl >/dev/null 2>&1
echo "prueba TTS..."
timeout 20 termux-tts-speak "Jorge en linea. Comi Colima listo." \
  && echo "TTS OK" || echo "TTS FALLO -> falta app Termux:API o voz es-MX"
termux-wake-lock
mkdir -p ~/.termux
grep -q allow-external-apps ~/.termux/termux.properties 2>/dev/null \
  || echo 'allow-external-apps=true' >> ~/.termux/termux.properties
cat > ~/jorge_oyente.sh <<'OY'
#!/data/data/com.termux/files/usr/bin/bash
termux-wake-lock
curl -sN https://ntfy.sh/comicolima-voz/json | python3 -u -c "
import sys, json, subprocess
for line in sys.stdin:
    try: m = json.loads(line)
    except Exception: continue
    if m.get('event') == 'message':
        print('Jorge dice:', m.get('message',''))
        subprocess.run(['termux-tts-speak', m.get('message','')])
"
OY
chmod +x ~/jorge_oyente.sh
mkdir -p ~/.termux/boot
printf '#!/data/data/com.termux/files/usr/bin/bash\nbash ~/jorge_oyente.sh >/dev/null 2>&1 &\n' > ~/.termux/boot/jorge.sh
chmod +x ~/.termux/boot/jorge.sh
pkill -f jorge_oyente.sh 2>/dev/null || true
nohup bash ~/jorge_oyente.sh >/dev/null 2>&1 &
echo "== oyente ACTIVO. Al reiniciar el telefono arranca solo (si hay Termux:Boot) =="
