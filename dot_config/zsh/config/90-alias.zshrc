# Command
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

# Restart
alias resource="source ${ZDOTDIR}/.zshrc"
alias reload='exec -l ${SHELL}'

# Editor
alias nvim='nvim --listen /tmp/nvimsocket'
alias e='nvr --remote-silent'
alias code='code-insiders'
