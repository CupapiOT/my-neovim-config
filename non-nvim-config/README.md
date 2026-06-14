# my-neovim-config's other configuration files

These files have parent-dir named after the title of the software that they are
meant to be used by.

## Current list with their intended directories

- `kanata.kbd`: (for Windows) `C:/Users/user/AppData/Roaming/kanata/` || (for
  Linux) `~/.config/`.
- `gnupg`: `~/.gnupg/`
- `gdb`: `~/.config/gdb/`
- The rest stay in `~/`.

## What each file does

- `kanata.kbd`: Maps capslock to (tap-hold) esc-ctrl, pausebreak to capslock,
  and implements a small version of vim motions. Enable by holding tab, disable
  by letting go of tab.
- `.bashrc`: Automatically starts tmux, adds a few personal aliases with
  `.bash-aliases`, adds the brave browser from Windows (WSL only).
  `.bash_logout` is executed when login shell exits.
- `.tmux.conf`: Implements a smoother integration with nvim by having
  C-h/j/k/l switch panes like they do in nvim.
- `gdbinit` and `gdbearlyinit`: Sets `gdb` to show intel-syntax for
  dissassembly with x86-64 architecture, removes a `debuginfod` configuration,
  remove startup message, enable history.
- `git`: Tells Git who I am, how to sign my commits, what editor to use, what
  my default branch name is, and how to obtain auth credentials (via GitHub CLI
  and a cache) when accessing GitHub.
- `gpg.conf`: configures GPG to use an agent for passphrase handling and allows
  passphrase entry through the terminal (loopback mode instead of a GUI
  prompt).
- `gpg-agent.conf`: it configures the GPG agent to use a terminal-based
  pinentry program and sets how long decrypted key passphrases are cached in
  memory before being forgotten.
