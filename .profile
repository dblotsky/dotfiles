# virtualenv
[[ -e ~/virtualenv_config.sh ]] && . ~/virtualenv_config.sh

# directory-marking
[[ -e ~/.jump.sh ]] && . ~/.jump.sh

# Git completion and prompt
[[ -e ~/.git-completion.sh ]] && . ~/.git-completion.sh
[[ -e ~/.git-ps1.sh ]] && . ~/.git-ps1.sh

# env
export PATH="${HOME}/bin:${PATH}"
export CLICOLOR=1
export EDITOR=/usr/bin/vim

# prompt
if [[ "${ZSH_NAME}" != "" ]]; then
    export PS1=$'(\e[1;33m%m\e[m) \e[32m\$(git_ps1)\e[33m\${PWD}\e[m\n \\-> %# '
else
    export PS1="(\[\e[1;33m\]\h\[\e[m\]) \[\e[32m\]\$(git_ps1)\[\e[33m\]\${PWD}\[\e[m\]\n \-> \\$ "
fi

# aliases
alias g="git"
alias such="git"
alias very="git"

alias l="ls -FlaGh"
alias ll="l"
alias ls-la="ls -la"
alias pyserve="python -m SimpleHTTPServer"
alias space="du -hs .[!.]* *"
alias cd..="cd .."
alias cd.="cd ."
alias ccd="cd"

# functions
