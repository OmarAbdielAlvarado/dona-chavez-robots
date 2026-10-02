#!/bin/bash
set -e
cd ~/proyectos/comi_colima/nodos
adb devices -l
echo "== apps termux en el Oppo =="
adb shell pm list packages | grep -i termux || true

python3 -m http.server 8000 --bind 127.0.0.1 >/tmp/http_jorge.log 2>&1 &
HTTP=$!; sleep 1
adb reverse tcp:8000 tcp:8000      # el telefono lee de TU PC por el cable, sin firewall

adb shell input keyevent KEYCODE_WAKEUP
adb shell wm dismiss-keyguard 2>/dev/null || true
adb shell monkey -p com.termux -c android.intent.category.LAUNCHER 1 >/dev/null 2>&1
sleep 5
adb shell input text 'pkg%sinstall%s-y%scurl;%scurl%s-s%s-O%shttp://127.0.0.1:8000/jorge_setup.sh;sbash%sjorge_setup.sh'
adb shell input keyevent 66
echo "== tecleando en el Oppo... mira su pantalla =="
sleep 40
adb shell dumpsys deviceidle whitelist +com.termux
adb shell dumpsys deviceidle whitelist +com.termux.api
kill $HTTP
echo "== prueba final desde PC (el Oppo debe hablar): =="
curl -d "Jorge, confirmacion: sistema Comi-Colima activo." ntfy.sh/comicolima-voz
