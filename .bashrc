#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1='\[\e[0;36m\]\u\[\e[m\]\[\e[0;37m\]@\[\e[m\]\[\e[;1;36m\]\h\[\e[m\]\[\e[0;93m\] \w \[\e[m\]\n\[\e[0;36m\]\$\[\e[m\] '
eval `dircolors ~/.i3/dircolors.256dark`

# git
source ~/.git-completion.bash
source ~/.git-prompt.sh
export PS1='$(__git_ps1 "\[\e[00;38;5;33m\](\[\e[0;35m\]%s\[\e[00;38;5;33m\])\[\e[m\] ")'$PS1

shopt -s checkwinsize

export VISUAL="vim"
export EDITOR="vim"

alias weather="curl wttr.in"

alias sd="shutdown now"

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

alias chrome="google-chrome-stable"

if [ -f $HOME/messages.txt ]
then
    if [ $(wc -l $HOME/messages.txt | cut -d' ' -f1) -gt 0 ]
	then
		echo " == Messages: == "
        cat $HOME/messages.txt
	else
		echo "No messages in messages.txt"
	fi
fi

alias vim="nvim"

alias pass="PASSWORD_STORE_ENABLE_EXTENSIONS=true pass"

set -o vi
