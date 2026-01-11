#!/bin/bash
#
# curl -Lks http://jayekub.github.io/dot.sh | /bin/bash
#
# based on https://www.atlassian.com/git/tutorials/dotfiles


cd $HOME

git clone --bare git@github.com:jayekub/dot.git $HOME/.dot

function dot {
    git --git-dir=$HOME/.dot/ --work-tree=$HOME $@
}

dot config --local status.showUntrackedFiles no
dot checkout

if [ $? = 0 ]; then
    echo "Checked out dotfiles."
else
    echo "Backing up existing dotfiles."

    mkdir -p $HOME/.dot-backup
    dot checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $HOME/.dot-backup/{}
    dot checkout
fi

