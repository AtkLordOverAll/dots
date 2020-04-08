# Atk's Zoomer Shell Config

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh-history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt appendhistory beep
bindkey -e

autoload -Uz compinit promptinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # All tab completion of hidden files
promptinit

autoload -U colors && colors

# Load aliases if present
[ -f "$HOME/.config/zsh/aliases" ] && source "$HOME/.config/zsh/aliases" || echo "Aliases not found"

# Warp directory (wd) Git install (my fork)
wd() {
    . /home/atk/Git\ Projects/wd/wd.sh
}

# Define the mkcd command
mkcd() {
    mkdir -p $1 && cd $1
}

# Define the rmout command
rmout() {
    DIR="$PWD"
    cd ..
    rm -rfv --interactive=once "$DIR"
}

## Dots management
_dots-git() {
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}

# Wraps around the bare git directory, tactically using stash to hide LICENSE and README files
dots-git() {
    case $1 in
        commit) [ -f ~/LICENSE ] && rm ~/LICENSE \
            ; [ -f ~/REAME.md ] && rm ~/README.md \
            ; _dots-git stash push -q ~/LICENSE ~/README.md \
            && _dots-git "$@" \
            && _dots-git stash pop -q ;;
        *) _dots-git "$@"
    esac
}
##

# P10k manual install
source ~/.config/p10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
p10k="$HOME/.config/zsh/p10k.zsh"
[ -f "$p10k" ] && source "$p10k"

# Fish syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
