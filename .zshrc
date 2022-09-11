# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment dependent
if [[ ! $SSH_CLIENT ]]; then
  PROMPT='[%F{4}%B%~%b%f]%F{15}%#%f '
  RPROMPT='[%F{3}%?%f]'
else
  PROMPT='[%F{6}%B%n%b%f@%F{6}%B%m%b%f][%F{4}%B%1~%b%f]%F{15}%#%f '
  alias neofetch='neofetch --ascii_distro artix_small'
fi

# Basic settings
ZLE_RPROMPT_INDENT=0
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
autoload -Uz compinit
compinit

# Keybinds
bindkey --  "^[[3~"     delete-char             # delete
bindkey --  "^[[H"      beginning-of-line       # home
bindkey --  "^[[F"      end-of-line             # end
bindkey --  "^[[1;5C"   forward-word            # ctrl + right
bindkey --  "^[[1;5D"   backward-word           # ctrl + left
bindkey --  "[Z"      reverse-menu-complete   # shift + tab
bindkey -s  "[1;3A"   "cd .. \n"              # alt + up
bindkey -s  "[1;3H"   "cd ~ \n"               # alt + home
bindkey -s  ""        "exit \n"               # ctrl + x
bindkey -s  "r"       "source ~/.zshrc \n"    # alt + r

# Include
source ~/.aliases
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/Repositories/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

# Splash screen
neofetch
