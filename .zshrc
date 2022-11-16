# .zshrc
HISTFILE=~/.local/state/zshist
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch
bindkey -v
zstyle :compinstall filename '/home/vlk/.zshrc'
autoload -Uz compinit
#compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
# End of lines added by automatic configurator
setopt append_history share_history histignorealldups
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}
autoload bashcompinit
bashcompinit
source /etc/profile.d/bash_completion.sh
# The following fixes zsh
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

source $HOME/.env
source $HOME/.aliasrc

# Runtime
zsh_colorscript.sh
if [ -f "$HOME/.python_history" ]; then rm -r "$HOME/.python_history"; fi
ls
eval "$(thefuck --alias)"
eval "$(starship init zsh)"
source $XDG_CONFIG_HOME/zsh-highlighter.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
