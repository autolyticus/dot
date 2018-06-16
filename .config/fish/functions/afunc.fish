function afunc -d 'Quick and dirty way to add a function to fish'
  for i in $argv
    e $HOME/.config/fish/functions/$i.fish
  end
end
