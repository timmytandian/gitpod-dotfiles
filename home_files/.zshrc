setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1001 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1001
SAVEHIST=1001
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

##########################################################################
# Key bindings
##########################################################################


##########################################################################
# Aliases
##########################################################################
# alert
# "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# ls
alias ls='lsd'

# Set more ls aliases
# Get the current alias for ls
current_ls_alias=$(alias ls 2>/dev/null | sed "s/^ls=//")

# Check if the ls is aliased into other tools like lsd or eva
if [[ $current_ls_alias == 'lsd' ]]; then
  # Set alias for other ls variants assuming we other tools.
  # Adjust this part to follow the other tool we use to alias the ls
  alias ll='ls -l'
  alias la='ls -a'
  alias lla='ls -la'
  alias lt='ls --tree'
else
  # Set alias for other ls variants assuming we use the vanilla ls
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'
fi

#######################################################################
# Set environment variables
#######################################################################
# set aws cli to automatically prompt cli options after pressing Enter
#export AWS_CLI_AUTO_PROMPT="on-partial"

# enable autocompleter for aws cli
export PATH=/usr/local/bin/aws_completer:$PATH
complete -C '/usr/local/bin/aws_completer' aws


#######################################################################
# Something else
#######################################################################

# Start Starship (to customize zsh to be pretty)
eval "$(starship init zsh)"

# Enable Terraform autocompletion in zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
