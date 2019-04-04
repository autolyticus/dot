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
export STACK_ROOT="$XDG_DATA_HOME/stack"
export WAKATIME_HOME="$XDG_DATA_HOME/wakatime"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export SDL_AUDIODRIVER='alsa'

appendpath () {
    if [[ ! -d "$1" ]]; then
        echo "Directory does not exist: $1"
        return
    fi
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
appendpath "$XDG_DATA_HOME/cargo/bin"
export PATH

unset appendpath


# Make keyboard not wake up the pc on sleep
if [ ! -e /tmp/usbWakeup.lck ] ; then
    echo XHC | sudo tee /proc/acpi/wakeup
    touch /tmp/usbWakeup.lck
fi


if [ "$(basename "$(tty)")" = 'tty1' ]; then
	startx
fi
[[ -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
