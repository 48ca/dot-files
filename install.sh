#!/bin/bash

pushd > /dev/null $(dirname ${BASH_SOURCE[0]})

if [ -z "$1" ]
then
	DESTDIR="$HOME"
else
	DESTDIR="$1"
fi

echo "Installing files to $DESTDIR"

if ! [ -d $DESTDIR ]; then mkdir $DESTDIR; fi

for d in $(find -type d -not -iwholename "*.git/*" )
do
	if [ -d "$DESTDIR/$d" ]; then continue; fi
	echo Making directory $DESTDIR/$d
	mkdir "$DESTDIR/$d"
done

for f in $(find -type f -not -iname "README.md" -not -iname "install.sh" -not -iwholename "*.git/*" )
do
	if [ -f $DESTDIR/$f ]
	then
		diff --color $DESTDIR/$f $f && continue
		echo "$DESTDIR/$f already exists"
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

if ! [ -f $DESTDIR/.weechat/ecdsa.pem ]
then
	echo "Decrypting ecdsa.pem for Weechat Freenode SASL authentication"
	gpg -o $DESTDIR/.weechat/ecdsa.pem -d $DESTDIR/.weechat/ecdsa.pem.asc
fi

popd > /dev/null
