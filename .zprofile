set -o PROMPT_SUBST

autoload compinit && compinit
autoload bashcompinit && bashcompinit

[[ -e ~/.profile ]] && . ~/.profile
