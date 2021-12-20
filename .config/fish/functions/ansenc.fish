function ansenc
    set temp (mktemp)
    pass mathworks/dynapro-ansible-vault-pass > $temp
    ansible-vault encrypt --encrypt-vault-id default --vault-password-file $temp $argv
end
