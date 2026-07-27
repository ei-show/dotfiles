export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=200000
export SAVEHIST=100000

setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt HIST_NO_STORE

unsetopt INC_APPEND_HISTORY
unsetopt INC_APPEND_HISTORY_TIME

# Keep fzf's file/directory widgets, but let Atuin own Ctrl-R.
export FZF_CTRL_R_COMMAND=
