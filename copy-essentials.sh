#!/bin/bash -e

# .vimrc, .bashrc, .inputrc, and git utils

function copydir() {
    echo "Copying directory $1"
    if [ -a ~/$1 ]
    then
        echo "Saving old $1 as $1.bak"
        mv ~/$1 ~/$1.bak
    fi
    cp -r ./$1 ~/$1
}
function copy() {
    echo "Copying file $1"
    if [ -a ~/$1 ]
    then
        echo "Saving old $1 as $1.bak"
        mv ~/$1 ~/$1.bak
    fi
    cp ./$1 ~/$1
}

copy .vimrc
copydir .vim
copy .inputrc
copy .git-completion.bash
copy .gitconfig
copy .git-prompt.sh
