#!/usr/bin/env bash

BLUE="${BLUE:-0xff2e7de9}"
GREEN="${GREEN:-0xff587539}"
RED="${RED:-0xfff52a65}"
SUBTLE="${SUBTLE:-0xff8990b3}"

if [ "$SENDER" = "mouse.clicked" ]; then
  open "x-apple.systempreferences:com.apple.Network-Settings.extension" >/dev/null 2>&1 &
fi

WIFI_DEVICE="$(networksetup -listallhardwareports 2>/dev/null | awk '/Hardware Port: (Wi-Fi|AirPort)/ {getline; print $2; exit}')"
WIFI_DEVICE="${WIFI_DEVICE:-en0}"

SSID="$(ipconfig getsummary "$WIFI_DEVICE" 2>/dev/null | awk -F ' : ' '/ SSID/ {print $2; exit}')"
IP="$(ipconfig getifaddr "$WIFI_DEVICE" 2>/dev/null)"

if [ -z "$SSID" ]; then
  SSID="$(networksetup -getairportnetwork "$WIFI_DEVICE" 2>/dev/null | sed 's/^Current Wi-Fi Network: //')"
fi

case "$SSID" in
  ""|*"not associated"*|*"not currently powered"*) SSID="" ;;
esac

if [ -n "$SSID" ]; then
  ICON="󰖩"
  COLOR="$BLUE"
  LABEL="$SSID"
elif [ -n "$IP" ]; then
  ICON="󰈀"
  COLOR="$GREEN"
  LABEL="$IP"
else
  ICON="󰖪"
  COLOR="$SUBTLE"
  LABEL="Off"
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
