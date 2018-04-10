#
# ~/.bash_profile
#
export USE_SDK_WRAPPER=yes

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(basename "$(tty)")" = 'tty1' ]; then
	startx
fi
