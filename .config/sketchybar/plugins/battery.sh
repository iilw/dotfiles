#!/usr/bin/env bash

GREEN="${GREEN:-0xff587539}"
YELLOW="${YELLOW:-0xff8c6c3e}"
RED="${RED:-0xfff52a65}"
SUBTLE="${SUBTLE:-0xff8990b3}"

BATTERY_INFO="$(pmset -g batt)"
PERCENTAGE="$(printf '%s\n' "$BATTERY_INFO" | grep -Eo '[0-9]+%' | head -n 1 | tr -d '%')"

if [ -z "$PERCENTAGE" ]; then
  sketchybar --set "$NAME" drawing=off
  exit 0
fi

CHARGING="off"
printf '%s\n' "$BATTERY_INFO" | grep -q "AC Power" && CHARGING="on"

case "$PERCENTAGE" in
  100|9[0-9]|8[0-9]) ICON=""; COLOR="$GREEN" ;;
  7[0-9]|6[0-9]|5[0-9]) ICON=""; COLOR="$GREEN" ;;
  4[0-9]|3[0-9]) ICON=""; COLOR="$YELLOW" ;;
  2[0-9]|1[0-9]) ICON=""; COLOR="$RED" ;;
  *) ICON=""; COLOR="$RED" ;;
esac

if [ "$CHARGING" = "on" ]; then
  ICON=""
  COLOR="$YELLOW"
fi

if [ "$PERCENTAGE" -ge 95 ] && [ "$CHARGING" = "on" ]; then
  ICON="󰂅"
  COLOR="$GREEN"
fi

sketchybar --set "$NAME" \
  drawing=on \
  icon="$ICON" \
  icon.color="$COLOR" \
  #label="${PERCENTAGE}%"
