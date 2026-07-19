#!/usr/bin/env bash

BLUE="${BLUE:-0xff2e7de9}"
GREEN="${GREEN:-0xff587539}"
LAVENDER="${LAVENDER:-0xff7847bd}"
MUTED="${MUTED:-0xff6172b0}"


if [[ "$1" == "bsp" || "$1" == "stack" || "$1" == "float" ]]; then
  yabai -m space --layout "$1"

  # 从组件名中提取主组件名 (例如从 layout.1.bsp 中把末尾的 .bsp 砍掉得到 layout.1)
  PARENT_NAME="${NAME%.*}"

  sketchybar --set "$PARENT_NAME" popup.drawing=off --trigger display_change

  exit 0
fi

if [[ "$1" == "toggle" ]]; then
  sketchybar --set "$NAME" popup.drawing=toggle
  exit 0
fi


DISPLAY_ID="${NAME##*.}"

LAYOUT="unknown"
if command -v yabai >/dev/null 2>&1; then
  LAYOUT="$(yabai -m query --spaces --display $DISPLAY_ID | jq -r '.[] | select(."is-visible" == true) | .type')"
fi

case "$LAYOUT" in
  bsp)
    ICON="󰘯"
    COLOR="$BLUE"
    LABEL="BSP"
    ;;
  stack)
    ICON="󰙀"
    COLOR="$LAVENDER"
    LABEL="STACK"
    ;;
  float)
    ICON="󰉈"
    COLOR="$GREEN"
    LABEL="FLOAT"
    ;;
  *)
    ICON="󰘯"
    COLOR="$MUTED"
    LABEL="N/A"
    ;;
esac

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="$LABEL"
