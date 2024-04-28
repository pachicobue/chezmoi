# Command
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ls='ls --group-directories-first --color=auto -F'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

# Restart
alias resource="source ${ZDOTDIR}/.zshrc"
alias reload='exec -l ${SHELL}'

# Editor
alias e='emacsclient'
alias nvim-client='nvr'
alias code='code-insiders'
