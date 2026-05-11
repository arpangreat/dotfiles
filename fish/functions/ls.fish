function ls
    command eza -l -g --git --color=always --header --hyperlink --icons=always $argv[1] | less -rF
end
