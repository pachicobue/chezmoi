setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1 list-colors di=34 ln=35 ex=31
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
