# my-neovim-config's other configuration files

These files have parent-dir named after the title of the software that they are
meant to be used by.

## Current list with their intended directories

- `kanata.kbd`: (for Windows) `C:/Users/user/AppData/Roaming/kanata/` || (for
  Linux) `~/.config/`.
- The rest stay in `~/`.

## What each file does

- `kanata.kbd`: Maps capslock to (tap-hold) esc-ctrl, pausebreak to capslock,
  and implements a small version of vim motions. Enable by holding tab, disable
  by letting go of tab.
- `.bashrc`: Automatically starts tmux, adds a few personal aliases, and adds
  the brave browser from windows (WSL only). Also has a separate file
  `.bash-aliases`.
- `.tmux.conf`: Implements a smoother integration with nvim by having
  C-h/j/k/l switch panes like they do in nvim.
- `.gdbinit`: Sets `gdb` to show intel-syntax for dissassembly with x86-64
  architecture, and also removes a `debuginfod` configuration.
