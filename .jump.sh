# CREDIT: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump {
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/ -/g' && echo
}
function _jump_complete() {
    local keys word

    word=${COMP_WORDS[COMP_CWORD]}
    keys=$(ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9 | grep "^$word")

    if [ ${#keys[*]} -gt 0 ]; then
        COMPREPLY=($(compgen -W "${keys[@]}" $word))
    fi

    return 0
}
complete -F _jump_complete jump
