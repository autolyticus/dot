function umnt --wraps 'umount'
    sudo umount $argv
end
