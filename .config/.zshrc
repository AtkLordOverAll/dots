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

# Load aliases if present
[ -f "$HOME/.config/aliases" ] && source "$HOME/.config/aliases" || echo "Aliases not found"

# Warp directory (wd) AUR install
wd() {
  . /usr/share/wd/wd.sh
}

# P10k manual install
source ~/.config/p10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh

# Fish syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
