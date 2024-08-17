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
_cd_project() {
	local prj_path=$(ghq list --full-path | sk)
	cd $prj_path
}
alias gcd=_cd_project 

# CP
alias dg++='cpt build'
alias fg++='cpt build --release'

# Restart
alias resource="source ~/.zshrc"
alias reload="exec -l ${SHELL}"

# Editor
alias e="${EDITOR}"
