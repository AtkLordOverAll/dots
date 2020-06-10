# Atk's dot files

*Always a work in progress*

Arch btw.

My preferred Sans Serif font is [Google's Product Sans](https://aur.archlinux.org/packages/ttf-google-sans/), and for monospace I find myself using [JetBrains Nerd Font](https://aur.archlinux.org/packages/nerd-fonts-jetbrains-mono/) for the ability to have both ligatures and emojis/symbols.

## Programs covered

* Git (global gitignore)

* i3

* [st](https://github.com/alpha-tango-kilo/st)

* nvim (WIP)

* polybar

* rofi

* yay

* zsh w/ [p10k](https://github.com/romkatv/powerlevel10k)

## Scripts

* rofi password prompt

* rofi emoji picker (stolen from [here](https://github.com/LukeSmithxyz/voidrice/blob/master/.local/bin/dmenuunicode))

* rofi wallpaper picker (sets using xwallpaper)

## My program setup

**DE/WM**: i3-gaps (looking to move to dwm)

**Bar**: polybar

**Theme** (GTK2/3): Zukitwo-dark

**Icons** (GTK2/3): Papirus-Dark

**Cursor**: Breeze

**Terminal**: st

**Notifications**: dunst

**Login Manager**: ly

**File Manager**: lf & Thunar

## How to use my dots

I would recommend cloning using this command:

```sh
git clone --depth 1 [HTTPS/SSH link]
```

This'll get you my dots downloaded without the README & LICENSE and with no unnecessary history.
From there, copy the files or symlink them with `ln -sf` to get yourself up and running.
It's always well worth a **re-log if you change `.profile`** (be it editing mine or replacing yours with mine)

## How I manage my dots
I have an alias in my [aliases files](https://github.com/AtkLordOverAll/dots/blob/master/.config/aliases#L32) which lets me use Git nicely to track the files simply by calling `dots-git`

For how to set this up for yourself, see the [ArchWiki](https://wiki.archlinux.org/index.php/Dotfiles).
All hail the ArchWiki
