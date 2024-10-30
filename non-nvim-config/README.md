# my-neovim-config's other configuration files

These are all files that are foldered by the title of the software that they
are meant to be used by.

## Current list with their intended directories

* **kanata.kbd**: (for Windows) C:/Users/user/AppData/Roaming/kanata/ || (for Linux)
~/.config/
* **.bashrc**: ~/
* **.tmux.conf**: ~/

## What each file does

* **kanata.kbd**: Maps capslock to (tap-hold) esc-ctrl, pausebreak to capslock, and
most importantly implements a modified version of vim motions, available to use
in any software. Enable by holding tab, disable by pressing tab in the mode.
* **.bashrc**: Automatically starts tmux, adds a few personal aliases, and adds
the brave browser from windows (mnt/c)
* **.tmux.conf**: Implements a smoother integration with nvim by having C-h/j/k/l
switch panes like they do in nvim.
