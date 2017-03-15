

source ~/.git-completion.bash
source ~/.git-prompt.sh

PS_USER='\[\033[01;32m\]\u'
PS_HOST='\h'
PS_USERHOST=$PS_USER'@'$PS_HOST
PS_CURDIR='\[\033[01;34m\]\w'
PS_SIGN='\\\$ \[\033[00m\]' # things after $ makes the standard text uncolored
PROMPT_COMMAND='__git_ps1 "'$PS_USERHOST''$PS_CURDIR'" "'$PS_SIGN'";'$PROMPT_COMMAND

