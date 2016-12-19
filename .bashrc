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
