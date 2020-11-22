#
# ~/.bash_profile
#
export USE_SDK_WRAPPER=yes
export EDITOR="nvim"
export PYTHONDONTWRITEBYTECODE=1
export TERM=xterm-256color

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
export LESSHISTFILE=-
export STACK_ROOT="$XDG_DATA_HOME/stack"
export WAKATIME_HOME="$XDG_DATA_HOME/wakatime"
export PUB_CACHE="$XDG_DATA_HOME/pub-cache"

export RUSTC_WRAPPER=sccache
export CALIBRE_USE_DARK_PALETTE=1


export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export SDL_AUDIODRIVER='alsa'

# Set up Node Version Manager
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export NVM_SOURCE="/usr/share/nvm"
# [ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"
export CALIBRE_LIBRARY="$HOME/.local/share/Library"
export MUSIC_LIBRARY="$HOME/.local/share/Music"

appendpath () {
    if [[ ! -d "$1" ]]; then
        echo "Directory does not exist: $1"
    fi
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

export PATH="$HOME/.local/bin:$PATH"
appendpath "$HOME/.cabal/bin"
appendpath "$HOME/.ghcup/bin"
appendpath "$PUB_CACHE/bin"
appendpath "$XDG_DATA_HOME/go/bin"
appendpath "$XDG_DATA_HOME/npm/bin"
appendpath "$XDG_DATA_HOME/cargo/bin"
export PATH

unset appendpath

# Color for manpages in less makes manpages a little easier to read
export LESS=-R
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
if type fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --no-ignore-vcs --hidden --follow --exclude .git --exclude node_modules 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # export FZF_ALT_C_COMMAND='rg --files --no-ignore --hidden --type d --follow -g "!{.git,node_modules}/*" 2> /dev/null'
else
    echo "Please install fd"
fi


# Make keyboard not wake up the pc on sleep
# if [ ! -e /tmp/usbWakeup.lck ] ; then
#     echo XHC | sudo tee /proc/acpi/wakeup
#     touch /tmp/usbWakeup.lck
# fi


# [[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
# if [ "$(basename "$(tty)")" = 'tty1' ]; then
#     startx &> /tmp/startx.log
# 	# sway-run
# fi
