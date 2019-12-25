if not set -q vars_initialized
    set -U vars_initialized

    # TODO Re-enable completion when stabilised
    # set -U FZF_COMPLETE 0
    set -U FZF_FIND_FILE_COMMAND "fd --hidden --no-ignore-vcs --exclude .git \$dir"
    set -U FZF_CD_COMMAND "fd --hidden --no-ignore-vcs --exclude .git --type d"
    set -U FZF_CD_WITH_HIDDEN_COMMAND $FZF_CD_COMMAND
end
