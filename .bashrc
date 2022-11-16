# .bashrc
shopt -s autocd
if [ -f /etc/bashrc ]; then	. /etc/bashrc ; fi

source $HOME/.env
source $HOME/.aliasrc

bash_colorscript.sh
ls
eval "$(thefuck --alias)"
eval "$(starship init bash)"


