#!/usr/bin/env bash

BLUE="${BLUE:-0xff2e7de9}"
TEXT="${TEXT:-0xff3760bf}"
MUTED="${MUTED:-0xff6172b0}"
SUBTLE="${SUBTLE:-0xff8990b3}"
TRANSPARENT="${TRANSPARENT:-0x00000000}"

SID="${NAME##*.}"
WINDOW_COUNT="0"

if command -v yabai >/dev/null 2>&1; then
  WINDOW_COUNT="$(yabai -m query --windows --space "$SID" 2>/dev/null | python3 -c 'import json,sys; print(len(json.load(sys.stdin)))' 2>/dev/null || echo 0)"
fi

if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color="$BLUE" \
    icon.color=0xffffffff \
    label.drawing=off
elif [ "$WINDOW_COUNT" -gt 0 ] 2>/dev/null; then
  sketchybar --set "$NAME" \
    background.drawing=off \
    background.color="$TRANSPARENT" \
    icon.color="$TEXT" \
    label.drawing=off
else
  sketchybar --set "$NAME" \
    background.drawing=off \
    background.color="$TRANSPARENT" \
    icon.color="$SUBTLE" \
    label.drawing=off
fi
