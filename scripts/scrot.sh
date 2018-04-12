#!/bin/bash

scrot "$@" -e "notify-send -a scrot 'Saved as \$f' && mv \$f ~/scrot/"
