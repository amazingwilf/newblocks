#!/usr/bin/env bash

CARD=`ls /sys/class/backlight` | head -n 1

get_backlight() {
  if [[ "$CARD" == *"intel_"* ]]; then
    BNESS=`xbacklight -get`
    LIGHT=${BNESS%.*}
  else
    LIGHT=$(printf "%.0f\n" `light -G`)
  fi
}

get_backlight
echo "^C03^   ^C15^$LIGHT%"
