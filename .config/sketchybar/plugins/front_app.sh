#!/usr/bin/env bash

LAVENDER="${LAVENDER:-0xff7847bd}"
SUBTLE="${SUBTLE:-0xff8990b3}"

APP="$INFO"
if [ -z "$APP" ]; then
  APP="$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)"
fi

if [ -z "$APP" ]; then
  APP="Desktop"
  COLOR="$SUBTLE"
else
  COLOR="$LAVENDER"
fi

case "$APP" in
  Finder) ICON="󰀶" ;;
  Safari) ICON="󰀹" ;;
  "Google Chrome"|Chrome|Chromium) ICON="" ;;
  "Visual Studio Code"|Code) ICON="󰨞" ;;
  Cursor) ICON="󰣆" ;;
  Terminal|iTerm2|Ghostty|kitty|WezTerm) ICON="" ;;
  Slack) ICON="󰒱" ;;
  Discord) ICON="󰙯" ;;
  Spotify|Music) ICON="󰝚" ;;
  *) ICON="󰣆" ;;
esac

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color="$COLOR" \
  label="$APP"
