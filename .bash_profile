#
# ~/.bash_profile
#
export USE_SDK_WRAPPER=yes
export EDITOR="nvim"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(basename "$(tty)")" = 'tty1' ]; then
	startx
fi
