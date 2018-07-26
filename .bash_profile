#
# ~/.bash_profile
#
export USE_SDK_WRAPPER=yes
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export HTTPIE_CONFIG_DIR="$XDG_CONFIG_HOME/httpie"
export LESSHISTFILE=-
export WAKATIME_HOME="$XDG_DATA_HOME/wakatime"


export ZDOTDIR="$HOME/.config/zsh"

appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

export PATH="$HOME/.local/bin:$PATH"
appendpath "$HOME/.pub-cache/bin"
appendpath "$XDG_DATA_HOME/go/bin"
appendpath "$XDG_DATA_HOME/npm/bin"
export PATH

unset appendpath

if [ "$(basename "$(tty)")" = 'tty1' ]; then
	startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
