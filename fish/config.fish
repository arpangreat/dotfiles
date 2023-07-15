set -gx EDITOR hx

# Go
set -g GOPATH $HOME/go

starship init fish | source

zoxide init fish --cmd cd | source

fish_vi_key_bindings

function fish_greeting
    shellfetch
end