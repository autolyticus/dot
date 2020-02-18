if not set -q abbrs_initialized
    for i in (abbr | awk '{print $5}')
        abbr -e $i
    end

    echo "SETTING ABBRS AGAIN"
    abbr .. 'cd ..'
    abbr ... 'cd ../..'
    abbr .... 'cd ../../..'
    abbr ..... 'cd ../../../..'
    abbr 000 'chmod -R 000'
    abbr 644 'chmod -R 644'
    abbr 666 'chmod -R 666'
    abbr 755 'chmod -R 755'
    abbr 777 'chmod -R 777'
    abbr abs 'abduco -A sudo sudo -HEs'
    abbr adb 'sudo adb'
    abbr adbsh 'sudo adb shell'
    abbr arch-chroot 'sudo arch-chroot'
    abbr bd 'prevd'
    abbr cal 'cal -3m'
    abbr cat 'bat'
    abbr cd.. 'cd ..'
    abbr cdh 'cd $HOME'
    abbr checkcommand 'type -t'
    abbr clone 'git clone'
    abbr compose 'sudo docker-compose'
    abbr d 'sudo docker'
    abbr da 'date "+%Y-%m-%d %A %T %Z"'
    abbr diff 'diff --color=auto'
    abbr df 'df -hT'
    abbr diskspace 'du -S | sort -n -r |more'
    abbr dot 'git --git-dir=$HOME/.dot/ --work-tree=$HOME'
    abbr dota 'git --git-dir=$HOME/.dot/ --work-tree=$HOME add'
    abbr dotc 'git --git-dir=$HOME/.dot/ --work-tree=$HOME commit -s -m'
    abbr dotp 'git --git-dir=$HOME/.dot/ --work-tree=$HOME push origin'
    abbr dots 'git --git-dir=$HOME/.dot/ --work-tree=$HOME status'
    abbr du 'du -hs'
    abbr eabbr 'e ~/.config/fish/conf.d/abbr.fish; and set -e abbrs_initialized'
    abbr evar 'e ~/.config/fish/conf.d/00-vars.fish; and set -e vars_initialized'
    abbr eat eatmydata
    abbr eb 'e ~/.bashrc'
    abbr epack 'e ~/.local/.packlist'
    abbr estack 'e .local/.stack'
    abbr firefoxInit 'pushd .; and cd $HOME/.mozilla/firefox/*.default; and mkdir -p chrome; and cd chrome; and echo '"'"'#TabsToolbar { visibility: collapse !important; }'"'"' > userChrome.css; and echo '"'"'@-moz-document url-prefix(about:blank) {*{background-color:#000000;}}'"'"' > userContent.css; popd'
    abbr fo 'fortilogin'
    abbr folders 'du -h --max-depth=1'
    abbr free 'free -h'
    abbr freshclam 'sudo freshclam'
    abbr g 'googler --notweak --noua'
    abbr gdot 'sudo git --git-dir=/.dot/ --work-tree=/'
    abbr gdota 'sudo git --git-dir=/.dot/ --work-tree=/ add'
    abbr gdotc 'sudo git --git-dir=/.dot/ --work-tree=/ commit -s -m'
    abbr gdotp 'sudo git --git-dir=/.dot/ --work-tree=/ push origin'
    abbr gdots 'sudo git --git-dir=/.dot/ --work-tree=/ status'
    abbr gita 'git add'
    abbr gitc 'git commit -s -m'
    abbr gitp 'git push --tags origin master'
    abbr gitpom 'git push --set-upstream origin master'
    abbr gits 'git status'
    abbr h 'history | grep '
    abbr hlp 'less /etc/bash.bashrc_help'
    abbr ip 'sudo ip'
    abbr ipa 'sudo ip a'
    abbr l 'lsd'
    abbr ls 'lsd'
    abbr lsblk 'lsblk -o NAME,PARTUUID,FSSIZE,FSTYPE,LABEL'
    abbr ll 'lsd -l'
    abbr la 'lsd -la'
    abbr m 'cd /media'
    abbr mkbz2 'tar -cvjf'
    abbr mkdir 'mkdir -p'
    abbr mkgz 'tar -cvzf'
    abbr mktar 'tar -cvf'
    abbr mmake 'make -B'
    abbr mnt 'sudo mount'
    abbr mntb 'sudo mount LABEL=B'
    abbr mntd 'sudo mount LABEL=D'
    abbr mntf 'sudo mount /dev/sdc1 /media/1'
    abbr mntff 'sudo mount /dev/sdc2 /media/2; and sudo mount /dev/sdc1 /media/2/boot'
    abbr mntpifs 'sshfs root@(avahi-resolve -4n rpi3.local | cut -f2):/ /rpi'
    abbr mntw 'sudo mount LABEL=W'
    abbr mntL 'sudo mount LABEL=LBackup'
    abbr mpcr 'mpc update; mpc crop; mpc ls | mpc add'
    abbr multitail 'multitail --no-repeat -c'
    abbr mv 'mv -i'
    abbr mx 'chmod a+x'
    abbr ncdu 'ncdu -xq'
    abbr netctl 'sudo netctl'
    abbr nimc 'nim c'
    abbr n 'nzb'
    abbr openports 'sudo netstat -nape --inet'
    abbr pd 'builtin cd -'
    abbr pdot 'git --git-dir=$HOME/.pdot/ --work-tree=$HOME'
    abbr pdota 'git --git-dir=$HOME/.pdot/ --work-tree=$HOME add'
    abbr pdotc 'git --git-dir=$HOME/.pdot/ --work-tree=$HOME commit -s -m'
    abbr pdotp 'git --git-dir=$HOME/.pdot/ --work-tree=$HOME push origin'
    abbr pdots 'git --git-dir=$HOME/.pdot/ --work-tree=$HOME status'
    abbr ping 'prettyping --nolegend -c 10'
    abbr pipi 'pip install --user'
    abbr pl 'pacman -Ql'
    abbr pm 'pacman -S'
    abbr pmy 'pacman -Sy'
    abbr pmm 'pacman -Syu'
    abbr pmr 'pacman -Rns'
    abbr pq 'pacman -Q'
    abbr pr 'pacman -Rns'
    abbr ps 'ps auxf'
    abbr py2off deactivate
    abbr py2on 'workon py2env'
    abbr r ranger
    abbr reboot 'sudo reboot'
    abbr restow 'sudo stow -vvv -R -d /home g -t /root'
    abbr rm 'rm -v'
    abbr rmd 'rm  -rfv'
    abbr rmlock 'sudo rm /var/lib/pacman/db.lck'
    abbr rsync 'rsync -aAXvPh --info=progress2'
    abbr rsynca 'rsync --no-W -avPh --info=progress2'
    abbr sha1 'openssl sha1'
    abbr sl 'lsd'
    abbr spi 'ssh -Y root@reisub.ddns.net'
    abbr spiy5 'ssh -Y root@192.168.1.7'
    abbr sshpi 'setpidate; and ssh -Y ubuntu@(avahi-resolve -4n rpi3.local | cut -f2)'
    abbr suu 'sudo -HEs'
    abbr sy 'sudo systemctl'
    abbr topcpu '/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'
    abbr tree 'tree -CAhF --dirsfirst'
    abbr treed 'tree -CAFd'
    abbr unbz2 'tar -xvjf'
    abbr ungz 'tar -xvzf'
    abbr untar 'tar -xvf'
    abbr vis 'vim "+set si"'
    abbr wifi-menu 'sudo wifi-menu'
    abbr wireshark 'sudo wireshark'
    abbr yay 'yay --aur'
    abbr yd 'youtube-dl -o "$MUSIC_LIBRARY/%(title)s.%(ext)s" -x --audio-format mp3 --audio-quality 0'
    abbr youtube-dl 'youtube-dl --external-downloader aria2c'
    abbr ys 'yay -S --noconfirm'
    abbr yu 'yay -Syu --aur --noconfirm'
    abbr zathura 'zathura --fork'
    abbr zt 'sudo zerotier-cli'

    set -U abbrs_initialized ''
end
