###################
### CTA profile ###
###################

# last updated: 8/29/16
# note ssh aliasing is handled in ~/.ssh/config

# fix this (below)
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin

# use git-completion and git-prompt scripts
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Change prompt
PS1_OLD=${PS1}
export PS1='[\! \u:\W$(__git_ps1 " (%s)")]\$ '

