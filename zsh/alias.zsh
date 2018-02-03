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
alias s=ssh
alias t='tig --all'
alias y=yarn

alias aa='git add . && git aa'
alias co='git co'
alias st='git st'
alias push='git push'
alias pull='git pull'
alias wip='git add . && git wip'

alias dx='docker run -it --rm'
alias rx='rbenv exec'
alias bx='bundle exec'

alias sl='brew services list'
alias start='brew services start'
alias stop='brew services stop'
alias restart='brew services restart'
alias upgrade='brew update && brew upgrade && brew cleanup && brew leaves'

alias images='docker images'
alias images-pull='docker images | tail -n +2 | awk '{print $1 ":" $2}' | grep -v ":<none>" | xargs -n1 docker pull'
alias images-clean='docker system prune -f'

alias ppp='echo -n `pwd` | pbcopy'
