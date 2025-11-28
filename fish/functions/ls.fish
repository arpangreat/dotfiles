function ls
    command eza -l -g --git --color=always --header --hyperlink $argv[1] | less -RF
end
