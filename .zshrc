# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment dependent
if [[ $SSH_CLIENT ]]; then
  alias neofetch='neofetch --ascii_distro artix_small'
fi

# Basic settings
PROMPT='%B%F{4}%~%F{%?}>%f '
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
bindkey -s  "r"       "source ~/.zshrc \n"    # alt + r
bindkey -s  "c"       "clear; neofetch \n"    # alt + c

# Include
source ~/.aliases
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/Repositories/powerlevel10k/powerlevel10k.zsh-theme && source ~/.p10k.zsh

# Splash screen
neofetch
