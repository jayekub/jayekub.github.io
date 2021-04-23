#!/bin/sh
# based on https://www.atlassian.com/git/tutorials/dotfiles

git clone --bare git@github.com:jayekub/dot.git $HOME/.dot

alias dot='git --git-dir=$HOME/.dot/ --work-tree=$HOME'

cd $HOME
dot config --local status.showUntrackedFiles no
dot checkout

if [ $? = 0 ]; then
    echo "Checked out dotfiles."
else
    echo "Backing up existing dotfiles."

    mkdir -p .dot-backup
    dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dot-backup/{}
    dot checkout
fi

