function lta
    command eza -l -g --git --tree -a --color=always --header --hyperlink $argv[1] | less -RF
end
