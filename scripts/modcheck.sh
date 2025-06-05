#!/bin/sh
DIRNAME=$(dirname $(realpath "$0"))
FILEPATH=$(find $DIRNAME -type f -name modcheck-*.jar)
java -jar "$FILEPATH" &
