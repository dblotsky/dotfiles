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

# Python 2
export PATH="${HOME}/Library/Python/2.7/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

# Python 3
export PATH="${HOME}/Library/Python/3.6/bin:/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH="${HOME}/Library/Python/3.7/bin:/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"

export CLICOLOR=1
export EDITOR=/usr/bin/vim

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=9999999
export HISTSIZE=9999999

# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE="${HOME}/.bash_eternal_history"

# prompt
if [[ "${ZSH_NAME}" != "" ]]; then
    export PS1=$'(\e[1;33m%m\e[m) \e[32m\$(git_ps1)\e[33m\${PWD}\e[m\n \\-> %# '
else
    export PS1="(\[\e[1;33m\]\h\[\e[m\]) \[\e[32m\]\$(git_ps1)\[\e[33m\]\${PWD}\[\e[m\]\n \-> \\$ "
fi

##############################
# functions
##############################

bake() {
    make $@
    tput bel
}

forget() {
    local substring=$1
    sed -i '' -E "/^${substring}.*/d" "${HOME}/.ssh/known_hosts"
}

WATCH_INTERVAL=1

watch() {
    CLEAR='\033[J'
    TOP='\033[1;1H'
    while true; do
        output=$(eval $@)
        echo -e "$TOP$CLEAR$output"
        sleep $WATCH_INTERVAL
    done
}

pythons() {
    for tool in {python,pip}{,2,2.7,3,3.6,3.7}; do
        local where=$(which "${tool}")
        local version=""
        if [ ! -z "${where}" ]; then
            version=$("${tool}" --version 2>&1)
        fi
        echo "${tool},${where},${version}"
    done
}

##############################
# aliases
##############################

alias g="git"
alias gl="git pull"
alias gs="git status"
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
