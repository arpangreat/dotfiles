function la
    command eza -l -g --git -a --color=always --header --hyperlink $argv[1] | less -RF
end
