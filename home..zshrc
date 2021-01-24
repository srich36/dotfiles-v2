# if you come from bash you might have to change your $path.
# export path=$home/bin:/usr/local/bin:$path

# path to your oh-my-zsh installation.
export ZSH="/home/sean/.oh-my-zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# set name of the theme to load. optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# see https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="spaceship"
alias pgcslogin="psql -d postgres --username crowdshout"
alias python="python3"
# set list of themes to load
# setting this variable when zsh_theme=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# an empty array have no effect
# zsh_theme_random_candidates=( "robbyrussell" "agnoster" )

# uncomment the following line to use case-sensitive completion.
# case_sensitive="true"

# uncomment the following line to use hyphen-insensitive completion. case
# sensitive completion must be off. _ and - will be interchangeable.
# hyphen_insensitive="true"

# uncomment the following line to disable bi-weekly auto-update checks.
# disable_auto_update="true"

# uncomment the following line to change how often to auto-update (in days).
# export update_zsh_days=13

# uncomment the following line to disable colors in ls.
# disable_ls_colors="true"

# uncomment the following line to disable auto-setting terminal title.
# disable_auto_title="true"

# uncomment the following line to enable command auto-correction.
# enable_correction="true"

# uncomment the following line to display red dots whilst waiting for completion.
# completion_waiting_dots="true"

# uncomment the following line if you want to disable marking untracked files
# under vcs as dirty. this makes repository status check for large repositories
# much, much faster.
# disable_untracked_files_dirty="true"

# uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# hist_stamps="mm/dd/yyyy"

# would you like to use another custom folder than $zsh/custom?
ZSH_CUSTOM=$HOME/.cusomt

# which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
# add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# user configuration

# export manpath="/usr/local/man:$manpath"

# you may need to manually set your language environment
# export lang=en_us.utf-8

# preferred editor for local and remote sessions
if [[ -n $ssh_connection ]]; then
 export editor='vim'
else
 export editor='mvim'
fi

# compilation flags
# export archflags="-arch x86_64"

# Load secrets
source "$HOME/.secretsrc"

alias gtree='git log --graph --abbrev-commit --decorate --date=relative --format=format:'\''%c(bold blue)%h%c(reset) - %c(bold green)(%ar)%c(reset) %c(white)%s%c(reset) %c(dim white)- %an%c(reset)%c(bold yellow)%d%c(reset)'\'' --all'
alias matlab='matlab &'
alias scrot='scrot ~/pictures/scrot/%b%d::%h%m%s.png'
#alias pip='pip3'
alias cal="cal -a 6"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)" 

export matlab_log_dir="/var/log/matlab"
export PATH="/usr/local/cuda-10.1/bin:/usr/local/cuda-10.1/nsightcompute-2019.1:$PATH:/home/sean/scripts"


#thon env variables
export virtualenvwrapper_python='/usr/bin/python3'
export workon_home=~/envs
alias quizzes="cd ~/quizzes; workon quizzes"
alias thonvenv="source /usr/local/bin/virtualenvwrapper.sh"
source /home/sean/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias polykill="killall -q polybar"
alias cowsay=cowsay_random
alias config='/usr/bin/git --git-dir=/home/sean/.cfg/ --work-tree=/home/sean'
alias tmp="cd $HOME/tmp"
alias oi3="vi $HOME/.config/i3/config"
alias opolybar="vi $HOME/.config/polybar/config"
alias post="cd $HOME/cs/thon/post"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"

alias thesis="cd $HOME/penn-state/thesis/rich_thesis"
fortune | cowsay
alias hdmioff="xrandr --output hdmi-1-2 --off"
compose_http_timeout=120
alias gapostsrc="git add frontend/src/*"
alias thesis="cd $HOME/penn-state/thesis/rich_thesis"
alias dbf="cd $HOME/penn-state/sailplane/dbf"
alias dragbuildup="cd $HOME/penn-state/sailplane/drag_buildup"
export compose_http_timeout=180
export PATH="$(yarn global bin):$PATH"


# kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'

# delete all stopped containers.
alias dockercleanc='printf "\n>>> deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# delete all untagged images.
alias dockercleani='printf "\n>>> deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'
alias dcdv="docker-compose down -v"
alias til="cd ~/cs/til"


## git aliases
alias gaf="git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git add"
alias gdiff="git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git diff"
alias grestores="git diff --name-only --cached | fzf -m --print0 | xargs -0 -o -t git restore --staged"
alias grestore="git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore" 
alias cleanbranches="git branch | fzf -m | xargs git branch -D"
alias gs="git status"
alias gd="git diff"


## shell aliases
alias ozsh="vi $HOME/.zshrc"
alias szsh="source $HOME/.zshrc"
alias otmux="vi $HOME/.tmux.conf"
alias stmux="tmux source $HOME/.tmux.conf"
alias ovim="vi $HOME/.vimrc"


export FZF_DEFAULT_OPTS='--bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'
# FZF functions

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

set editing-mode vi
set keymap vi

bindkey jj vi-cmd-mode  
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function pingrouter() {
 ip route | grep 'default' | awk '{ print $3 }' | xargs ping
}

# Fix zsh-autosuggesion syntax highlighting in tmux
export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
