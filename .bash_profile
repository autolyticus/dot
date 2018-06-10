#
# ~/.bash_profile
#
export USE_SDK_WRAPPER=yes
export EDITOR="nvim"
export GOPATH="$HOME/go"
export MAINFLUX_ID='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE1MjY1NjU4ODEsImlhdCI6MTUyNjUyOTg4MSwiaXNzIjoibWFpbmZsdXgiLCJzdWIiOiJhdmFuY2VyQGdtYWlsLmNvbSJ9.9yNN9dTD8-x9CgTezLhbos27LJeBZAnuxUndyBBJ2Bs'
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

export PATH="$HOME/.local/bin:$PATH"
appendpath "$HOME/.npm_global/bin"

unset appendpath

if [ "$(basename "$(tty)")" = 'tty1' ]; then
	startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
