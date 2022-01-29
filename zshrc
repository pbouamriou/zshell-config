case "$TERM" in
	xterm-color|*-256color) ;;
	xterm) ;;
	screen) export TERM=xterm-256color;;
esac

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
antigen bundle cargo
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle docker-compose
antigen bundle node
antigen bundle kubectl
antigen bundle command-not-found
antigen bundle bobsoppe/zsh-ssh-agent
antigen bundle jimeh/zsh-peco-history
antigen bundle cakecatz/zsh-peco-ghq

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Async
antigen bundle mafredri/zsh-async

# Auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='awesome-patched'
antigen theme bhilburn/powerlevel9k powerlevel9k

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

