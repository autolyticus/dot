function pacman --description 'A smart wrapper for pacman' --wraps 'pacman'
    if test (type -f pacman)
        sudo pacman $argv
    else
        if test (type -f pacapt)
            sudo pacapt $argv
        else
            echo "Pacman/Pacapt don't seem to be installed"
            return 1
        end
    end
end
