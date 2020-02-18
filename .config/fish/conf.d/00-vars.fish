if not set -q vars_initialized
    for i in (cat (status filename) | sed '/set -U/s/^\s*#//' | egrep '^\s*set -U' | awk '{print $3}')
        set -e $i
    end

    # Completion still has some bugs
    # set -U FZF_COMPLETE 0

    echo "SETTING VARS AGAIN"
    set -U theme_color_scheme base16
    set -U FZF_FIND_FILE_COMMAND "fd --hidden --no-ignore-vcs --exclude .git . \$dir"
    set -U FZF_CD_COMMAND "fd --hidden --no-ignore-vcs --exclude .git --type d"
    set -U FZF_CD_WITH_HIDDEN_COMMAND $FZF_CD_COMMAND

    set -U vars_initialized ''
end
