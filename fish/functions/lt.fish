function lt
    command eza -l -g --git --tree --color=always --header --hyperlink $argv[1] | bat
end
