export KPRINCIPAL=$(klist -A | sed -n 2p | cut -d: -f 2 | xargs | cut -d@ -f 1)
export KDOMAIN=$(klist -A | sed -n 2p | cut -d: -f 2 | xargs | cut -d@ -f 2 | cut -d. -f 1)

username=$KPRINCIPAL
if [ -z $KPRINCIPAL ]; then
	username="\u"
fi

if ! [ -z $KDOMAIN ]; then
	KDOMAIN="$KDOMAIN "
fi

export PS1="\[\e[0;36m\]$username\[\e[m\]\[\e[0;34;96m\]@\h\[\e[m\]\[\e[1;33m\] \w \n$KDOMAIN\[\e[0;36m\]\$\[\e[m\] "
