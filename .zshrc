export CC=clang
export CXX=clang++
export CMAKE_GENERATOR=Ninja
export XDG_RUNTIME_DIR=/run/user/1000
export EDITOR=nvim

alias tat="tmux attach -t"
alias tns="tmux new-session"
alias lg='lazygit'
alias f='clear; fastfetch'
alias nv='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias xterm='xterm -bg black -fg white'
alias td='tmux detach'
alias ta='tmux attach'
alias i='yay -S'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"



function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}


bindkey -s '^T' 'tmux\n'

run() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: run <program> [args...]"
        return 1
    fi

    app="$1"
    shift
    args=("$@")

    ninja && ./"$app" "${args[@]}"
}


eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

echo -ne '\e[6 q'
