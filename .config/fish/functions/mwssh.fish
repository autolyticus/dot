function mwssh --wraps 'ssh'
    SSHPASS=(pass mathworks/$argv) sshpass -e ssh "$argv"
end
