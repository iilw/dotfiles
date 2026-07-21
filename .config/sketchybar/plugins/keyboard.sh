#!/bin/bash

# Prefer the active input-source identifier; fall back to the keyboard layout ID.
PREFERENCES="$HOME/Library/Preferences/com.apple.HIToolbox.plist"
LAYOUT_ID="$(defaults read "$PREFERENCES" AppleCurrentKeyboardLayoutInputSourceID 2>/dev/null)"


# Specify short layouts by input-source ID.
case "$LAYOUT_ID" in
    com.apple.keylayout.PinyinKeyboard) SHORT_LAYOUT="󰗊";;
    com.apple.keylayout.ABC) SHORT_LAYOUT="󰌌";;
    *) SHORT_LAYOUT="";;
esac

sketchybar --set keyboard label="$SHORT_LAYOUT"
