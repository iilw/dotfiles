#!/usr/bin/env bash
set -u

ITEM_NAME="${NAME:-network}"
GREEN="${GREEN:-0xff587539}"
STATE_DIR="${NETWORK_STATE_DIR:-$HOME/.cache/sketchybar}"
STATE_FILE="$STATE_DIR/network-state"
ROUTE_CMD="${NETWORK_ROUTE_CMD:-route}"
NETSTAT_CMD="${NETWORK_NETSTAT_CMD:-netstat}"
NOW_CMD="${NETWORK_NOW_CMD:-date}"
SKETCHYBAR_CMD="${SKETCHYBAR_BIN:-sketchybar}"

render() {
  local download="$1"
  local upload="$2"

  "$SKETCHYBAR_CMD" --set "$ITEM_NAME" \
    icon="󰈀" \
    icon.color="$GREEN" \
    label="↓ $(format_rate "$download")/s  ↑ $(format_rate "$upload")/s"
}

format_rate() {
  local bytes="$1"
  local unit_bytes=1
  local unit="B"
  local whole
  local fraction

  if [ "$bytes" -ge 1073741824 ]; then
    unit_bytes=1073741824
    unit="G"
  elif [ "$bytes" -ge 1048576 ]; then
    unit_bytes=1048576
    unit="M"
  elif [ "$bytes" -ge 1024 ]; then
    unit_bytes=1024
    unit="K"
  fi

  if [ "$unit" = "B" ]; then
    printf '%sB' "$bytes"
    return
  fi

  whole=$((bytes / unit_bytes))
  fraction=$(((bytes % unit_bytes) * 10 / unit_bytes))
  printf '%s.%s%s' "$whole" "$fraction" "$unit"
}

reset_baseline() {
  rm -f "$STATE_FILE"
  render 0 0
}

valid_uint() {
  case "$1" in
    ''|*[!0-9]*) return 1 ;;
    *) return 0 ;;
  esac
}

read_state() {
  [ -f "$STATE_FILE" ] || return 1

  IFS=$'\t' read -r PRIOR_INTERFACE PRIOR_RECV PRIOR_SENT PRIOR_TIME < "$STATE_FILE" || return 1
  [ -n "$PRIOR_INTERFACE" ] || return 1
  valid_uint "$PRIOR_RECV" && valid_uint "$PRIOR_SENT" && valid_uint "$PRIOR_TIME"
}

write_state() {
  local interface="$1"
  local received="$2"
  local sent="$3"
  local now="$4"
  local temporary_file

  umask 077
  mkdir -p "$STATE_DIR" || return 1
  temporary_file="$(mktemp "$STATE_DIR/.network-state.XXXXXX")" || return 1
  printf '%s\t%s\t%s\t%s\n' "$interface" "$received" "$sent" "$now" > "$temporary_file" || {
    rm -f "$temporary_file"
    return 1
  }
  mv -f "$temporary_file" "$STATE_FILE"
}

INTERFACE="$("$ROUTE_CMD" -n get default 2>/dev/null | awk '/^[[:space:]]*interface:/ {print $2; exit}')"
if [ -z "$INTERFACE" ]; then
  reset_baseline
  exit 0
fi

COUNTERS="$("$NETSTAT_CMD" -ibn 2>/dev/null | awk -v interface="$INTERFACE" '$1 == interface && $3 ~ /^<Link#/ {print $7, $10; exit}')"
set -- $COUNTERS
RECEIVED="${1:-}"
SENT="${2:-}"
NOW="$("$NOW_CMD" +%s 2>/dev/null)"

if ! valid_uint "$RECEIVED" || ! valid_uint "$SENT" || ! valid_uint "$NOW"; then
  reset_baseline
  exit 0
fi

if ! read_state \
  || [ "$PRIOR_INTERFACE" != "$INTERFACE" ] \
  || [ "$RECEIVED" -lt "$PRIOR_RECV" ] \
  || [ "$SENT" -lt "$PRIOR_SENT" ] \
  || [ "$NOW" -le "$PRIOR_TIME" ]; then
  write_state "$INTERFACE" "$RECEIVED" "$SENT" "$NOW" || true
  render 0 0
  exit 0
fi

ELAPSED=$((NOW - PRIOR_TIME))
DOWNLOAD=$(((RECEIVED - PRIOR_RECV) / ELAPSED))
UPLOAD=$(((SENT - PRIOR_SENT) / ELAPSED))

write_state "$INTERFACE" "$RECEIVED" "$SENT" "$NOW" || true
render "$DOWNLOAD" "$UPLOAD"
