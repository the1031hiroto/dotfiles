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
alias f='git fetch'
alias g=git
alias h='history -E 1 | less +G'
alias l=less
alias o=open
alias p=pbpaste
alias s=ssh
alias t='tig --all'
alias y=yarn

alias aa='git add . && git aa'
alias co='git co'
alias st='git st'
alias fetch='git fetch'
alias push='git push'
alias pull='git pull'
alias wip='git add . && git wip'
alias branch-clean='git branch --merged master | grep -v master | xargs -n1 git branch -D'
alias stash='git stash -u'
alias pop='git stash pop'

alias dx='docker run -it --rm'
alias dxx='docker exec -it'
alias rx='rbenv exec'
alias bx='bundle exec'

alias sl='brew services list'
alias run='brew services run'
alias start='brew services start'
alias stop='brew services stop'
alias restart='brew services restart'
alias upgrade='brew update && brew upgrade && brew cleanup && brew leaves'
alias cask='brew cask'

alias di='docker images'
alias images='docker images'
alias images-pull='docker images | tail -n +2 | awk '\''{print $1 ":" $2}'\'' | grep -v ":<none>" | xargs -n1 docker pull'
alias images-clean='docker system prune -f'
alias dtail='docker logs --tail 10 -f'

alias e2e='yarn test:e2e'

alias ppp='echo -n `pwd` | pbcopy'

alias z-reload='. ~/.zshrc && . ~/.zshrc.local'
