function ls
    command eza -l -g --git --color=always --header --hyperlink --icons=auto $argv[1] | bat
end
