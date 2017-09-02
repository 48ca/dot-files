#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
export PS1='\[\e[1;36m\]\u\[\e[m\]\[\e[1;37m\]@\[\e[m\]\[\e[;1;36m\]\h\[\e[m\]\[\e[0;36m\] \w \[\e[m\]\n\[\e[1;34m\]\$\[\e[m\] '
eval `dircolors ~/.i3/dircolors.256dark`

# git
source ~/.git-completion.bash
source ~/.git-prompt.sh
export PS1='$(__git_ps1 "\[\e[00;38;5;33m\](\[\e[0;35m\]%s\[\e[00;38;5;33m\])\[\e[m\] ")'$PS1

shopt -s checkwinsize

# Ruby
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Python
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/home/james/venv/bin/python
source /usr/bin/virtualenvwrapper.sh

export VISUAL="vim"
export EDITOR="vim"

alias weather="curl wttr.in"

alias sd="shutdown now"

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'

alias chrome="google-chrome-stable"

if [ -f $HOME/messages.txt ]
then
	messages=$(cat $HOME/messages.txt | sed 's/^#.*$//g')
	if ! [ -z "$messages" ]
	then
		echo " == Messages: == "
		echo $messages
	else
		echo "No messages in messages.txt"
	fi
fi

alias fbm="node $HOME/node_modules/fb-messenger-cli/cli.js"
alias messeenger="fbm"

alias compile=". ~/uva/env.sh && compile"

alias vim="nvim"
