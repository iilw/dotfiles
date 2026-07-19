#!/usr/bin/env bash

LAVENDER="${LAVENDER:-0xff7847bd}"
RED="${RED:-0xfff52a65}"
SUBTLE="${SUBTLE:-0xff8990b3}"

if [ "$SENDER" = "mouse.clicked" ]; then
  osascript -e 'set volume output muted not (output muted of (get volume settings))' >/dev/null 2>&1
fi

if [ -n "$INFO" ] && [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"
else
  VOLUME="$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)"
fi

MUTED="$(osascript -e 'output muted of (get volume settings)' 2>/dev/null)"

if [ "$MUTED" = "true" ] || [ -z "$VOLUME" ] || [ "$VOLUME" -eq 0 ]; then
  ICON="󰖁"
  COLOR="$SUBTLE"
  LABEL=" 0%"
elif [ "$VOLUME" -ge 70 ]; then
  ICON="󰕾"
  COLOR="$LAVENDER"
  LABEL="${VOLUME}%"
elif [ "$VOLUME" -ge 30 ]; then
  ICON="󰖀"
  COLOR="$LAVENDER"
  LABEL="${VOLUME}%"
else
  ICON="󰕿"
  COLOR="$LAVENDER"
  LABEL=" ${VOLUME}%"
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  #label="$LABEL"
