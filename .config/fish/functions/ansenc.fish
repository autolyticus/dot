function ansenc
    pass mathworks/dynapro-ansible-vault-pass | ansible-vault encrypt --vault-password-file /dev/stdin $argv
end
