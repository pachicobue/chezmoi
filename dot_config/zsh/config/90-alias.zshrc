# Command
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ls='eza --icons --git'
alias ll='eza -aahl --icons --git'
alias la='eza -a --icons --git'
alias lt='eza -T -L 3 -I "node_modules|.git|.cache" --icons'
alias lta='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'

# ghq
alias gcd='cd "$(ghq list --full-path | fzf)"'

# CP
alias dg++='cp-tools build'
alias fg++='cp-tools build --release'

# Restart
alias resource="source ~/.zshrc"
alias reload='exec -l ${SHELL}'

# Editor
alias e='nvim'
alias hx='helix'
alias code='code-insiders'
