#!/usr/bin/env bash

TEXT="${TEXT:-0xff3760bf}"

CLOCK_LABEL="$(date '+%-m/%-d %A %H:%M')"

sketchybar --set "$NAME" \
  icon.drawing=off \
  label="$CLOCK_LABEL" \
  label.color="$TEXT" \
  label.padding_left=8
