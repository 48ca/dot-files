#!/bin/bash

pushd > /dev/null $(dirname ${BASH_SOURCE[0]})

DESTDIR="$HOME"

if ! [ -d $DESTDIR ]; then mkdir $DESTDIR; fi

for d in $(find -type d -not -iwholename "*.git/*" )
do
	if [ -d "$DESTDIR/$d" ]; then continue; fi
	echo Making directory $DESTDIR/$d
	mkdir "$DESTDIR/$d"
done

for f in $(find -type f -not -iname "install.sh" -not -iwholename "*.git/*" )
do
	if [ -f $DESTDIR/$f ]
	then
		diff --color $f $DESTDIR/$f >/dev/null && continue
		if $?; then continue; fi # | cat # sed -i '1s|^|'$DESTDIR/$f'already exists|'
		echo "$DESTDIR/$f already exists"
		echo -e $res
		echo -n "Replace? [y/N] "
		read y
		case $y in
			[yY]*)
				echo "Replacing $f with $DESTDIR/$f..."
				cp $f $DESTDIR/$f
				;;
			*)
				echo "Skipping $f..."
				;;
		esac
	else
		echo "Copying $f to $DESTDIR/$f..."
		cp $f $DESTDIR/$f
	fi
done

popd > /dev/null
