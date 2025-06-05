#!/bin/sh
DIRNAME=$(dirname $(realpath "$0"))
FILENAME=$(find $DIRNAME -type f -printf "%f\n" -name NinjaLink-*.jar)

mkdir ~/.config/NinjaLink
cd ~/.config/NinjaLink
java -jar "$DIRNAME/$FILEPATH" &

