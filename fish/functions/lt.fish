function lt
    command eza -l -g --git --tree --color=always --header --hyperlink --icons=always $argv[1] | less -rF
end
