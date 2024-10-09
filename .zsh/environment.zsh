#!/usr/bin/env zsh

### ZSH HOME
export ZSH=$HOME/.zsh

### PATH
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

### XDG Base Directory paths
export XDG_CONFIG_HOME="${HOME}/.config"          # User configuration files
export XDG_CACHE_HOME="${HOME}/.cache"            # User cache files
export XDG_DATA_HOME="${HOME}/.local/share"       # User data files
export XDG_STATE_HOME="${HOME}/.local/state"      # User state files

# Set other tool and configuration paths to clean up ~
export CARGO_HOME="$XDG_DATA_HOME"/cargo          # Cargo package manager
export GNUPGHOME="$XDG_DATA_HOME"/gnupg           # GNU Privacy Guard home
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}"/java \
                      -Dawt.useSystemAAFontSettings=gasp" # Java preferences
export ANDROID_HOME="${XDG_DATA_HOME}/android"    # Android SDK home

# Set zsh shell history file path and set max history length
export ZSH_FZF_HISTORY_SEARCH_DATES_IN_SEARCH=0 # Disable dates in zsh-fzf-history
export ZSH_FZF_HISTORY_SEARCH_EVENT_NUMBERS=0 # Disable index in zsh-fzf-history
export ZSH_FZF_HISTORY_SEARCH_REMOVE_DUPLICATES=1 # Hide duplicates in zsh-fzf-history

### ---- history config -------------------------------------
export HISTFILE="${XDG_STATE_HOME}/zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

### ---- PLUGINS & THEMES -----------------------------------
#source $ZSH/themes/spaceship-prompt/spaceship.zsh-theme
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)

### --- Spaceship Config ------------------------------------

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  # vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="#"
SPACESHIP_CHAR_SUFFIX=" "

# Add additional directories to PATH
export PATH=${PATH}:~/.local/scripts:~/.local/bin:~/.local/share/cargo/bin
export PATH=$PATH:/home/rei/.spicetify

# Set sudo password prompt
export SUDO_PROMPT='[] Enter Password: '

# Set default editor
export EDITOR='nano'

# Set language environment
export LANG=en_US.UTF-8

# Set default file manager
export fileManager='thunar'

export RUST_BACKTRACE=1
