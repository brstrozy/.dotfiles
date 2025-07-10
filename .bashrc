#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#######################
# CUSTOM CONFIG START #
#######################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite i
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


alias ll='ls -la --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

source /usr/share/git/completion/git-prompt.sh
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[01;31m\]$(__git_ps1 " (%s)")\[\033[00m\]\n❯ '
PROMPT_COMMAND="echo"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"

export notesdir="/home/brstrozy/personal/applications/obsidian/data/notes/"

fnotes(){
    #nvim +"cd $notesdir" +"Telescope find_files"
    local save_pwd="$PWD"
    cd "$notesdir" || return
    #nvim +"Telescope find_files"
    nvim -c "lua require('telescope_start')"
    cd "$save_pwd" || return
}

notes(){
    #nvim +"cd $notesdir" "$notesdir/todo.md"
    local save_pwd="$PWD"
    cd "$notesdir" || return
    nvim "todo.md"
    cd "$save_pwd" || return
}

if [[ -z "$TMUX" ]]; then
    neofetch
fi

#######################
# CUSTOM CONFIG END   #
#######################

