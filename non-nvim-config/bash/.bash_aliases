# Some more ls aliases (flags explained)
#   * `a`: "all" (do not ignore entries starting with `.`)
#   * `-l`: "use long listing format"
#   * `-F`/`--classify[=WHEN]` means "append indicator (one of */=>@|) to 
#     entries WHEN". 
#     Those indicators indicate that an entry is:
#     - `/`: directory
#     - `*`: executable
#     - `@`: symlink (symbolic link)
#     - `|`: named pipe (FIFO)
#     - `=`: socket
#     - `>`: door (not usually seen on Linux)
#     Note that those are all just visual indicators.
alias ll='ls -alF'
#   * `-A`: "almost all" (do not list implied . and ..)
alias la='ls -A'
#   * '-C`: "list entries by column"
alias l='ls -CF'

# Add an "alert" alias for long running commands (doesn't work). Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Personal aliases
alias nv='nvim'
alias aptupd="sudo apt-get update"
alias aptupg="sudo apt-get upgrade"
alias aptupdg="sudo apt-get update && sudo apt-get upgrade"
alias brave="/mnt/c/Program\ Files/BraveSoftware/Brave-Browser/Application/brave.exe"
