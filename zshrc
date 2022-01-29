case "$TERM" in
	xterm-color|*-256color) POWERLEVEL9K_COMPATIBLE=1;;
	xterm) ;;
	screen) export TERM=xterm-256color; POWERLEVEL9K_COMPATIBLE=1;;
esac

if [ -n "${SSH_CLIENT}" ]; then
   touch ~/.zshrc
fi

screenfetch=$(which screenfetch)
if [ ! -z "${screenfetch}" ]; then
	$screenfetch
fi

source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle rust
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle docker-compose
antigen bundle node
antigen bundle kubectl
antigen bundle command-not-found
antigen bundle bobsoppe/zsh-ssh-agent
antigen bundle jimeh/zsh-peco-history
antigen bundle cakecatz/zsh-peco-ghq
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle mafredri/zsh-async

IP_SSH_CLIENT=$(echo $SSH_CLIENT | awk '{print $1;}')

if [ -n "${POWERLEVEL9K_COMPATIBLE}" ]; then
   if [ -z "${SSH_CLIENT}" ]; then
      THEME="POWERLEVEL9K"
   elif [ "${IP_SSH_CLIENT}" = "2a01:cb05:898d:a300:1ac0:4dff:fe00:573" ]; then
      THEME="POWERLEVEL9K"
   fi
fi

if [ "${THEME}" = "POWERLEVEL9K" ]; then
   # Load the theme.
   POWERLEVEL9K_PROMPT_ON_NEWLINE=true
   POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
   POWERLEVEL9K_MODE='awesome-patched'
   antigen theme bhilburn/powerlevel9k powerlevel9k
else
   antigen theme sindresorhus/pure@main
fi

# Tell Antigen that you're done.
antigen apply

zle -N zsh-peco-ghq
bindkey '^]' zsh-peco-ghq

if [ -e ~/bin/zsh_env ]
then
	source ~/bin/zsh_env
fi

if [ -e ~/bin/zsh_functions ]
then
	source ~/bin/zsh_functions
fi

if [ -e ~/bin/zsh_alias ]
then
	source ~/bin/zsh_alias
fi

if [ -n "${SSH_CLIENT}" ]; then
   touch ~/.zshrc
fi

