export ZSH="$HOME/.oh-my-zsh"

plugins=(git tmux vi-mode )



export LS_COLORS='di=0;35:fi=0;37:ln=0;36:so=0;32:pi=0;33:ex=0;31:'
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export SDL_VIDEODRIVER=x11
export CC=clang
export CXX=clang++
export CMAKE_GENERATOR=Ninja
export XDG_RUNTIME_DIR=/run/user/1001
export EDITOR=nvim
export BAT_THEME=base16

alias focus1="swaymsg workspace 1 output eDP-1"
alias tat="tmux attach -t"
alias tns="tmux new-session"
alias lg='lazygit'
alias f='clear; fastfetch'
alias nv='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ...='cd ../..'
alias ....='cd ../../..'
alias xterm='xterm -bg black -fg white'
alias kbdbrightnessdwn='sudo brightnessctl -d smc::kbd_backlight set 5%-'
alias kbdbrightnessup='sudo brightnessctl -d smc::kbd_backlight set +5%'
alias xr='sudo xbps-remove $argv'
alias td='tmux detach'


spf() {
    export SPF_LAST_DIR="$HOME/.local/state/superfile/lastdir"

    command spf "$(pwd)"

    if [[ -f "$SPF_LAST_DIR" ]]; then
        source "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    fi
}

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

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

