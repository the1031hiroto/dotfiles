alias -g G='| grep '
alias -g M='| more '
alias tmux='tmux -u'

if [ 'Darwin' = $(uname -s) ]; then
  alias ls='ls -FG'   # Mac
else
  alias ls='ls -Fv --color'  # Linux
fi
alias ll='ls -lh'
alias la='ls -lah'
alias lR='ls -lahR'

alias a=atom
alias b=brew
alias c=pbcopy
alias d=docker
alias g=git
alias h='history -E 1 | less +G'
alias o=open
alias p=pbpaste
alias s='brew services'
alias t='tig --all'
alias y=yarn

alias aa='git aa'
alias co='git co'
alias st='git st'
alias push='git push'
alias pull='git pull'
alias wip='git add . && git wip'

alias rx='rbenv exec'
alias bx='bundle exec'

alias sl='brew services list'
alias start='brew services start'
alias stop='brew services stop'
alias upgrade='brew update && brew upgrade'

alias ppp='echo -n `pwd` | pbcopy'
