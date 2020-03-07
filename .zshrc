# Atk's Zoomer Shell Config

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt appendhistory beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/atk/.zshrc'

autoload -Uz compinit promptinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # All tab completion of hidden files
promptinit

autoload -U colors && colors

alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias gotop='gotop -b'
alias reboot='sudo reboot'
alias sleep='systemctl suspend'
alias shutdown='shutdown now'
alias hibernate='systemctl hibernate'
alias brightness='sudo brightnessctl'
alias backup='aconfmgr -c ~/.aconfmgr save'
alias what-broke='sudo journalctl -b -1 -p 3'
alias what-break='sudo journalctl -b 0 -p 3'
alias vim='nvim'
alias nano='nvim'
alias nvpn-c='nordvpn c United_Kingdom'
alias nvpn-d='nordvpn d'
alias nvpn-r='nvpn-d && nvpn-c'
alias figlet='figlet -t'
alias ix=$'curl -F \'f:1=<-\' ix.io'
alias copy-to-clipboard='xclip -selection clipboard'
alias nay='yay -Rns'
alias dots-git='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Warp directory (wd) AUR install
wd() {
  . /usr/share/wd/wd.sh
}

# Autojump (j) AUR install
source /etc/profile.d/autojump.zsh

# Fish syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# P10k manual install
source ~/.config/p10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
