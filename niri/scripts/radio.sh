#!/bin/bash

# Your radio stream URL — change this!
STREAM_URL="https://stream.radiojar.com/8s5u5tpdtwzuv" # example
RADIO_NAME="اذاعه القران الكريم"
PID_FILE="/tmp/radio.pid"

if [ -f "$PID_FILE" ] && kill -0 "$(cat $PID_FILE)" 2>/dev/null; then
  # Radio is running → stop it
  kill "$(cat $PID_FILE)"
  rm -f "$PID_FILE"
  notify-send -i "audio-x-generic" "🕌 اذاعه القران الكريم" "تم إيقاف البث" --expire-time=2000

else
  # Radio is not running → start it
  mpv --no-video --force-media-title="$RADIO_NAME" "$STREAM_URL" &
  echo $! >"$PID_FILE"
  notify-send -i "audio-x-generic" "🕌 اذاعه القران الكريم" "جاري البث الآن..." --expire-time=2000

fi
