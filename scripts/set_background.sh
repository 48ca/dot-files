#!/bin/bash

set -e

pushd $(dirname ${BASH_SOURCE[0]}) > /dev/null

RES=$(xrandr -q | awk -F'current' -F',' 'NR==1 {gsub("( |current)","");print $2}')

echo "Detected resolution: $RES"

INPUT="$1"

TMP=/tmp/screen.png

LOCK=lock.png

echo "Resizing..."
convert $INPUT -resize $RES^ -gravity center -crop $RES+0+0 +repage $TMP

cp $TMP ~/.i3/background.png

echo "Blurring..."
convert $TMP -blur 0x10 $TMP

echo "Darkening..."
convert $TMP -fill black -colorize 75% $TMP

echo "Compositing..."
convert -gravity center $TMP $LOCK -composite $TMP

# feh $TMP

echo "Copying..."
cp $TMP ~/.i3/lock-screen.png

popd > /dev/null
