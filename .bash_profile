# virtualenv
if [ -e ~/virtualenv_config.bash ]; then
    source ~/virtualenv_config.bash
fi

# node.js
export PATH=/usr/local/share/npm/bin:$PATH

# aliases
alias g="git"
alias l="ls -FlaGh"
alias pyserve="python -m SimpleHTTPServer"
alias space="du -hs .[!.]* *"

# directory marking
source ~/jump.bash

# Git
source ~/git-completion.bash
# source ~/autojmp.bash

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_ENABLED=true

function disable_git_ps1
{
  export GIT_PS1_ENABLED=false
}

function enable_git_ps1
{
  export GIT_PS1_ENABLED=true
}

function git_ps1
{
  $GIT_PS1_ENABLED && __git_ps1 "%s "
}

# bash
export PATH=~/bin:$PATH
export CLICOLOR=1
export EDITOR=/usr/bin/vim
export PS1="(\[\e[1;33m\]\[\h\]\[\e[m\]) \[\e[32m\]\[\$(git_ps1)\]\[\e[33m\]\$PWD\[\e[m\]\n╰ -> "
