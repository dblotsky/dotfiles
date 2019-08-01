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
