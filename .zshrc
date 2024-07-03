
# export PATH=$HOME/bin:/usr/local/bin:$PATH
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# set up menu style
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="rkj-repos"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git ripgrep vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys to move in menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-up-line-or-history
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# set up shell integration for aichat
# type in the text and press alt-e to activate aichat
_aichat_zsh() {
    if [[ -n "$BUFFER" ]]; then
        local _old=$BUFFER
        BUFFER+="⌛"
        zle -I && zle redisplay
        BUFFER=$(aichat -e "$_old")
        zle end-of-line
    fi
}
zle -N _aichat_zsh
bindkey '^E' _aichat_zsh

alias vim='nvim'
alias ls='exa -al --icons --git'
alias lt='exa -la --icons --git --tree --level=2'
alias cat="bat"
alias zshconfig="vim ~/.zshrc"
alias python='python3'
alias pip='pip3'
alias prod-db='python3 -m aiven.admin --config ~/aiven-core/aiven-prod-read-only.json'
alias nproc="sysctl -n hw.logicalcpu"
# This is for local binaries that don't belong anywhere else
export PATH="/Users/clay.ratliff/.local/share/bin::$PATH"

# This ensures that we're using the Homebrew versions of everything
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/libtool/bin/:$PATH"
export PATH="/opt/homebrew/opt/pkg-config/bin:$PATH"
export TERMINAL=alacritty
# This prevents the pain point of GPG
GPG_TTY=$(tty)
export GPG_TTY

# So many things depend on this being here I just want to set it explicitly
export XDG_CONFIG_HOME="/Users/clay.ratliff/.config"

# I don't like the default directory that tpm uses to put tmux plugins
#export TMUX_PLUGIN_MANAGER_PATH="~/.config/tmux/plugins"

# use fzf in the shell for things like history search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use zoxide
eval "$(zoxide init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/clay.ratliff/GCP-tooling/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/clay.ratliff/GCP-tooling/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/clay.ratliff/GCP-tooling/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/clay.ratliff/GCP-tooling/google-cloud-sdk/completion.zsh.inc'; fi
. ~/.avnadmapi.sh

# Created by `pipx` on 2024-04-16 17:55:25
export PATH="$PATH:/Users/clay.ratliff/.local/bin"
# Adding the /opt podman path
export PATH="$PATH:/opt/podman/bin"
export PATH="$HOME/personal-stuff/development/flutter/bin:$PATH"
export PATH=$HOME/.gem/bin:$PATH
export ANDROID_HOME="/Users/clay.ratliff/Library/Android/sdk"
export PATH="$PATH:/$ANDROID_HOME/tools"
export PATH=:"$PATH:$ANDROID_HOME/tools/bin"
export PATH=:"$PATH:$ANDROID_HOME/platform-tools"
export PATH=:"$PATH:$ANDROID_HOME/cmdline-tools/bin"
