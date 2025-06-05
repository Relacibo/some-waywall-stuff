#!/bin/sh
DIRNAME=$(dirname $(realpath "$0"))
FILEPATH=$(find $DIRNAME -type f -name Ninjabrain-Bot-*.jar)
java -jar "$FILEPATH" &
