function gitcl --description 'Clone a repo from Github, or the source'
    if test (echo "$argv" | egrep 'github|gitlab')
       git clone "$argv"
    else
        git clone https://github.com/"$argv"
    end
end
