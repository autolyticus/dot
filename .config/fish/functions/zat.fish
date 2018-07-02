function zat
    if test -z "$argv"
      set fileToView (bfs . -regex '.*\.pdf' -type f | fzf)
      echo "zathura $fileToView"
      zathura "$fileToView"
      endif
    else
	echo "zathura $argv"
	zathura "$argv"
    end
end
