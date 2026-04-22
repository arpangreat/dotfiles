function la
    command eza -l -g --git -a --color=always --header --hyperlink --icons=always $argv[1] | less -rF
end
