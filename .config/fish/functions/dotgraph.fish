function dotgraph
	git --work-tree=$HOME --git-dir=$HOME/.dot log --graph --abbrev-commit --decorate '--format=format:'"'"'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'"'"' ' --all
end

