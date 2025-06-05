#!/bin/sh
DIRNAME=$(dirname $(realpath "$0"))

PRISM_INSTANCE_NAME="1.16.1" # Replace with the (real) name of your instance

if [ "$1" = "--coop" ]; then
  $DIRNAME/ninjalink.sh &
fi

# Here I let prism use my virtual audio cable
# CURRENT_DEFAULT_SINK=$(pactl get-default-sink)
# pactl set-default-sink virtual_game 
# flatpak run com.obsproject.Studio & # Start OBS
$DIRNAME/ninjabrain.sh
# sleep 2s # Sleeping to avoid race condition with the sound
# prismlauncher -l "$PRISM_INSTANCE_NAME" & # Start minecraft
# sleep 20s # Sleeping to avoid race condition with the sound
# pactl set-default-sink $CURRENT_DEFAULT_SINK # Reset back to old default sink
