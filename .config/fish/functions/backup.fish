function backup -d 'Backup entire root to LBackup partition'
	sudo mount /media/LBackup; and 
	sudo rsync -aAXvr --partial /* /media/LBackup --exclude={/dev/*,/proc/*,/sys/*,/tmp/*,/tmp,/var/tmp/*,/run/*,/mnt/*,/media/*,/lost+found,/var,/home/g/Downloads,/boot,'*.cache*'}
	sudo umount /media/LBackup
end

