abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a nv nvim
abbr -a v vim
abbr -a e emacs
abbr -a ec emacsclient
abbr -a l ls
abbr -a ll 'ls -la'
abbr -a rd 'sudo rmdir'
abbr -a rf 'sudo rm -rf'
abbr -a ch 'sudo chmod +x'
abbr -a chu 'sudo chmod u+x'
abbr -a s sudo
abbr -a sv 'sudo vim'
abbr -a snv 'sudo nvim'
abbr -a se 'sudo emacs'
abbr -a sec 'sudo emacsclient'
abbr -a frc 'vim ~/.config/fish/config.fish'
abbr -a vrc 'vim ~/.vimrc'
abbr -a nrc 'nvim ~/.config/nvim/init.vim'
abbr -a brc 'vim ~/.bashrc'
abbr -a arc 'vim ~/.config/alacritty/alacritty.yml'
abbr -a irc 'vim ~/.config/i3/config'
abbr -a m make
abbr -a o xdg-open
abbr -a g git
abbr -a gco 'git checkout'
abbr -a gc 'git clone'
abbr -a gp 'git pull'
abbr -a ga 'git add -p'
abbr -a vimdiff 'nvim -d'
abbr -a ct 'cargo t'
abbr -a amz 'env AWS_SECRET_ACCESS_KEY=(pass www/aws-secret-key | head -n1)'
abbr -a ais "aws ec2 describe-instances | jq '.Reservations[] | .Instances[] | {iid: .InstanceId, type: .InstanceType, key:.KeyName, state:.State.Name, host:.PublicDnsName}'"
abbr -a print 'lp -h cups.csail.mit.edu -d xerox9 -oDuplex=DuplexNoTumble -oStapleLocation=SinglePortrait'
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a ks 'keybase chat send'
abbr -a kr 'keybase chat read'
abbr -a kl 'keybase chat list'
fish_vi_key_bindings

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

function fish_greeting
	neofetch

	set_color normal


function cgit
	git add .
	git init
	git commit -m "'$1'"
	git push -u origin master
end

end
