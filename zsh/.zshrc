# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Timing Commands
# REPORTTIME=0

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  aliases
#  autoenv
  colored-man-pages
  copypath
  copyfile
  cp
  dirhistory
  extract
  safe-paste
  web-search
  autojump
  docker
  copybuffer
  sudo
  history
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt notify
bindkey -v

# Custom Keybinds
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Compinstall
zstyle :compinstall filename '/home/avtzis/.zshrc'
autoload -Uz compinit
compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
 compinit -i
else
 compinit -C -i
fi

zmodload -i zsh/complist

# Starship
eval "$(starship init zsh)"

# Extra Plugins
source /home/avtzis/.zsh/fast-syntax-highlighting/F-Sy-H.plugin.zsh
source /home/avtzis/.zsh/completion.zsh
#source /home/avtzis/.zsh/shift-select.zsh
source /home/avtzis/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/avtzis/.zsh/fancies/fancies.zsh

# Aliases
alias pacin='sudo pacman -S'
alias parin='paru -S'
alias sui='sudo pacman -Suy && paru -Su'
alias pacout='sudo pacman -R'
alias paclean='sudo pacman -Sc'
alias q='exit'
alias pokemon='pokemon-colorscripts -r'
alias backtick='echo "`" | xsel -ib'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias lst='ls --tree'
alias tasks='task list'
alias cowsayfortunegay='cowsayfortune | lolcat'
alias clipboard='xsel -ib'
alias sound='alsactl --file ~/.config/asound.state restore'
alias neogay='nf --gay'
alias kappapride='catimg -H 40 ~/Pictures/6216_kappapride.png'
alias vim='nvim'

# Cow-spoken fortunes every time you open a terminal
function cowsayfortune {
    NUMOFCOWS=`cowsay -l | tail -n +2 | wc -w`
    WHICHCOW=$((RANDOM%$NUMOFCOWS+1))
    THISCOW=`cowsay -l | tail -n +2 | sed -e 's/\ /\'$'\n/g' | sed $WHICHCOW'q;d'`

    #echo "Selected cow: ${THISCOW}, from ${WHICHCOW}"
    fortune | cowsay -f $THISCOW -W 100
}

# Neofetch alias
function nf {
  case "$1" in
    -g)
      neofetch | lolcat
      return 0;;
    --gay)
      neofetch | lolcat
      return 0;;
    ?) shift;;
  esac
  
  neofetch
}

# Startup scripts
cowsayfortunegay
#alsactl --file ~/.config/asound.state restore
