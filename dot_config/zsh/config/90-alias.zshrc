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
alias gcd='cd "$(ghq list --full-path | fzf)"'

# Restart
alias resource="source ${ZDOTDIR}/.zshrc"
alias reload='exec -l ${SHELL}'

# Editor
alias nvim='nvim --listen /tmp/nvimsocket'
alias e='nvr --remote-silent'
alias code='code-insiders'
