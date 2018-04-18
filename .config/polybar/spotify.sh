#!/bin/sh

function trim() {
    STR="$@"
    if [ ${#STR} -gt 53 ]
    then
        echo -n "$(echo $STR | cut -c 1-50)"
        echo -n "..."
    else
        echo -n "$STR"
    fi
}

main() {
  if ! pgrep -x spotify >/dev/null; then
    echo ""; exit
  fi

  cmd="org.freedesktop.DBus.Properties.Get"
  domain="org.mpris.MediaPlayer2"
  path="/org/mpris/MediaPlayer2"

  meta=$(dbus-send --print-reply --dest=${domain}.spotify \
    /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:${domain}.Player string:Metadata)

  paused=$(if [ $(playerctl status) = "Paused" ]; then echo " (Paused)"; fi)

  artist=$(echo "$meta" | sed -nr '/xesam:artist"/,+2s/^ +string "(.*)"$/\1/p' | tail -1 | sed 's/\//\\\//g;s/\&/\\&/g')
  album=$(echo "$meta" | sed -nr '/xesam:album"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1 | sed 's/\//\\\//g;s/\&/\\&/g')
  titlelong=$(echo "$meta" | sed -nr '/xesam:title"/,+2s/^ +variant +string "(.*)"$/\1/p' | tail -1 | sed 's/\//\\\//g;s/\&/\\&/g')
  title=$(trim $titlelong)

  echo "${*:-%artist% - %title%} $paused" | sed "s/%artist%/$artist/g;s/%title%/$title/g;s/%album%/$album/g"i | grep -vi "error" | grep -v "xesam"
}

main "$@"
