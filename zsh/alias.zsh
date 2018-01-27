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
alias c=pbcopy
alias g=git
alias d=docker
alias o=open
alias p=pbpaste
alias y=yarn

alias aa='git aa'
alias co='git co'
alias st='git st'
alias push='git push'

alias be='bundle exec'
alias s='brew services'
alias sl='brew services list'
alias start='brew services start'
alias stop='brew services stop'

alias t='tig --all'

alias ppp='echo -n `pwd` | pbcopy'
