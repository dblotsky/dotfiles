set -o PROMPT_SUBST

autoload compinit && compinit
autoload bashcompinit && bashcompinit

# alt-delete
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\=\/}
    zle backward-kill-word
}
zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir

# alt-back
backward-dir() {
    local WORDCHARS=${WORDCHARS/\=\/}
    zle backward-word
}
zle -N backward-dir
bindkey '^[b' backward-dir

# alt-forward
forward-dir() {
    local WORDCHARS=${WORDCHARS/\=\/}
    zle forward-word
}
zle -N forward-dir
bindkey '^[f' forward-dir

[[ -e ~/.profile ]] && . ~/.profile
