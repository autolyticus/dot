function ansdec
    pass mathworks/dynapro-ansible-vault-pass | ansible-vault decrypt --vault-password-file /dev/stdin $argv
end
