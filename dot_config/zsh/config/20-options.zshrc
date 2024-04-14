# History
HISTFILE="${HOME}/.config/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
autoload history-search-end

# CD
autoload -Uz cdr
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
function chpwd() { ls -ltr --color=auto }
