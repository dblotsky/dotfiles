##############################
# shell
##############################

# history
shopt -s histappend

##############################
# includes
##############################

# virtualenv
[[ -e ~/virtualenv_config.sh ]] && . ~/virtualenv_config.sh

# directory-marking
[[ -e ~/.jump.sh ]] && . ~/.jump.sh

# Git completion and prompt
[[ -e ~/.git-completion.sh ]] && . ~/.git-completion.sh
[[ -e ~/.git-ps1.sh ]] && . ~/.git-ps1.sh

##############################
# env
##############################

export PATH="${HOME}/bin:${PATH}"

# Python 2.7
export PATH="${HOME}/Library/Python/2.7/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Python 3.6
export PATH="${HOME}/Library/Python/3.6/bin:/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

export CLICOLOR=1
export EDITOR=/usr/bin/vim

# prompt
if [[ "${ZSH_NAME}" != "" ]]; then
    export PS1=$'(\e[1;33m%m\e[m) \e[32m\$(git_ps1)\e[33m\${PWD}\e[m\n \\-> %# '
else
    export PS1="(\[\e[1;33m\]\h\[\e[m\]) \[\e[32m\]\$(git_ps1)\[\e[33m\]\${PWD}\[\e[m\]\n \-> \\$ "
fi

##############################
# functions
##############################

function bake {
    make $@
    tput bel
}

function forget {
    local substring=$1
    sed -i '' -E "/^${substring}.*/d" "${HOME}/.ssh/known_hosts"
}

function watch {
    CLEAR='\033[J'
    TOP='\033[1;1H'
    while true; do
        output=$(eval $@)
        echo -e "$TOP$CLEAR$output"
        sleep 1
    done
}

##############################
# aliases
##############################

alias g="git"
alias such="git"
alias very="git"
alias gl="git pull"

alias l="ls -FlaG"
alias ll="l"
alias ls-la="ls -la"
alias pf="pip freeze"
alias pyserve="python -m SimpleHTTPServer"
alias space="du -hs .[!.]* *"

alias cd..="cd .."
alias cd.="cd ."
alias ccd="cd"

alias a3="source .venv3/bin/activate"
alias a="source .venv/bin/activate"

# finally, go into repositories folder
cd ~/Developer/repositories
