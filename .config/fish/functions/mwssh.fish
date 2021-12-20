function mwssh --wraps 'ssh'
    set host (echo $argv | sed 's|.mathworks.com||g')
    echo "ssh $host.mathworks.com"
    # ping -w1 -c1 -W1 $host.mathworks.com
    ssh -oPubkeyAcceptedAlgorithms=+ssh-rsa -oHostKeyAlgorithms=+ssh-rsa $host.mathworks.com
    # SSHPASS=(pass mathworks/$argv) sshpass -e ssh "$argv"
end
