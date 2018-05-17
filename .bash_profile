#
# ~/.bash_profile
#
export USE_SDK_WRAPPER=yes
export EDITOR="nvim"
export GOPATH="$HOME/.go"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(basename "$(tty)")" = 'tty1' ]; then
	startx
fi
