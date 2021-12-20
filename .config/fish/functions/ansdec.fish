function ansdec
    set temp (mktemp)
    pass mathworks/dynapro-ansible-vault-pass > $temp
    ansible-vault decrypt --vault-password-file $temp $argv
end
