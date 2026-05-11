function lta
    command eza -l -g --git --tree -a --color=always --header --hyperlink --icons=always $argv[1] | less -rF
end
