function lta
    command eza -l -g --git --tree -a --color=always --header --hyperlink --icons=auto $argv[1] | bat
end
