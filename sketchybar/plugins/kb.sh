#!/bin/sh

layout=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep 'KeyboardLayout Name' | awk -F '"' '{print $3}' | tr -d '[:space:];=')

if [ -z "$layout" ]; then
    layout="SE"
fi

sketchybar --set "$NAME" label="$layout"
