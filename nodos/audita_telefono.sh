#!/bin/bash
echo "==== $(adb shell getprop ro.product.model) | Android $(adb shell getprop ro.build.version.release) ===="
echo "-- APPS --"
for p in com.termux com.termux.api com.termux.boot io.heckel.ntfy; do
  adb shell pm list packages $p 2>/dev/null | grep -q $p && echo "[OK]    $p" || echo "[FALTA] $p"
done
echo "-- TTS --"
echo "motor TTS del sistema: $(adb shell settings get secure tts_default_synth)"
echo "-- BATERIA (sin optimizar) --"
adb shell dumpsys deviceidle whitelist | grep -iE "termux|ntfy" || echo "[FALTA] nadie en whitelist -> Android matara Termux en segundo plano"
echo "-- ALMACENAMIENTO --"
adb shell df -h /data | tail -1
echo "-- PROBE: control remoto sin teclear (RUN_COMMAND) --"
adb shell am startservice --user 0 -n com.termux/com.termux.app.RunCommandService \
  -a com.termux.RUN_COMMAND \
  --es com.termux.RUN_COMMAND_PATH /data/data/com.termux/files/usr/bin/sh \
  --esa com.termux.RUN_COMMAND_ARGUMENTS '-c,id > /sdcard/jorge_probe.txt' \
  --ez com.termux.RUN_COMMAND_BACKGROUND true 2>&1 | head -3
sleep 4
adb shell cat /sdcard/jorge_probe.txt 2>/dev/null && echo "== RUN_COMMAND FUNCIONA: control total sin tocar pantalla ==" || echo "== RUN_COMMAND bloqueado (no hay Termux o allow-external-apps esta off) =="
