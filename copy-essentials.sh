#!/bin/bash -e

# .vimrc, .bashrc, .inputrc, and git utils

function copy() {
    if [ -a ~/$1 ]
    then
        echo "Saving old $1 as $1.bak"
        mv ~/$1 ~/$1.bak
    fi
    cp ./$1 ~/$1
}

copy .vimrc
copy .inputrc
copy .git-completion.bash
copy .gitconfig
copy .git-prompt.sh
