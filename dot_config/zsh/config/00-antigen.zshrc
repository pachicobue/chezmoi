if [ ! -e $ZDOTDIR/antigen.zsh ]; then
    curl -L git.io/antigen > $ZDOTDIR/antigen.zsh
fi

# Load antigen.zsh
source $ZDOTDIR/antigen.zsh

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

# Apply installation
antigen apply

# Source Package
export ANTIGEN_BUNDLES=$HOME/.antigen/bundles
source $ANTIGEN_BUNDLES/zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh
