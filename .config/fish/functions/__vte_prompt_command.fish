function __vte_prompt_command
  set -l hname (string replace -r '\..*$' '' $HOSTNAME)
  printf "\033]0;%s@%s:%s\007%s" "$USER" "$hname" ""(__vte_osc7)""
end
