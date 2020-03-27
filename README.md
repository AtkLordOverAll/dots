# Atk's dot files
*Always a work in progress*

Arch btw.

My preferred Sans Serif font is [Google's Product Sans](https://aur.archlinux.org/packages/ttf-google-sans/), and for monospace I find myself using FiraCode Nerd Font for the ability to have both ligatures and emojis/symbols. Ordinarily I do just prefer Hack patched with ligatures.

## Programs covered
* Git (global gitignore)
* i3
* kitty
* nvim (WIP)
* polybar
* rofi
* yay
* zsh w/ [P10k](https://github.com/romkatv/powerlevel10k)

## Scripts
* rofi password prompt
* rofi emoji picker (stolen from [here](https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/dmenuunicode))
* rofi wallpaper picker (sets using feh)

## How to use my dots
I would recommend cloning using this command:
```sh
git clone -b without-docs --depth 1 [HTTPS/SSH link]
```
This'll get you my dots downloaded without the README & LICENSE and with no unnecessary history. From there, copy the files or symlink them with `ln -sf` to get yourself up and running. It's always well worth a **reboot if you change `.profile`** (be it editing mine or replacing yours with mine)

## How I manage my dots
I have an alias in my [aliases files](https://github.com/AtkLordOverAll/dots/blob/master/.config/aliases#L32) which lets me use Git nicely to track the files simply by calling `dots-git`. For my personal use, I naturally stick to the `without-docs` branch so I don't have the README and LICENSE in `~`

For how to set this up for yourself, see the [ArchWiki](https://wiki.archlinux.org/index.php/Dotfiles). All hail the ArchWiki.
