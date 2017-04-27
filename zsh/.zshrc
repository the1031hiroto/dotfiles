export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/libexec:$PATH"

if [ -e /etc/profile ] ; then
  . /etc/profile
fi

if [ -e ~/.zshrc.local ] ; then
  . ~/.zshrc.local
fi

# fpath
if [ -d "/usr/local/share/zsh/site-functions" ]; then
  fpath=("/usr/local/share/zsh/site-functions" $fpath)
fi
if [ -d "/usr/local/share/zsh-completions" ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi
if [ -d "${HOME}/.zsh/zsh-completions" ]; then
  fpath=("${HOME}/.zsh/zsh-completions" $fpath)
fi

autoload colors
colors

UID_COLOR=${fg[green]}
case ${UID} in
0)
  UID_COLOR=${fg[red]}
  ;;
*)
  ;;
esac

HOST_COLOR=0
I=0
for c in $(hostname | awk '{len=split($0,str,""); for(i=1; i<=len; i++){print str[i]}}')
do
  HOST_COLOR=$((${HOST_COLOR} + $(printf "%d" "'${c}")))
  I=$((${I} + 1))
done;
HOST_COLOR="$(printf "%%F{%03d}@%%f" "$((${HOST_COLOR} / ${I}))")"

# # VCS
# autoload -Uz vcs_info
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' stagedstr "!"
# zstyle ':vcs_info:*' unstagedstr "+"
# # zstyle ':vcs_info:*' stagedstr "%F{yellow}!"
# # zstyle ':vcs_info:*' unstagedstr "%F{red}+"
# # zstyle ':vcs_info:*' formats "%F{green}[%b%c%u] (%S)"
# #--
# zstyle ':vcs_info:*' formats "[%b%c%u] (%r/%S)"
# zstyle ':vcs_info:*' actionformats "(%b|%a) [%r:%S]"
#
# precmd () {
#         psvar=()
#         LANG=en_US.UTF-8 vcs_info
#         [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
# }

# VCS
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
        psvar=()
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


PROMPT="[%{$UID_COLOR%}%n%{${reset_color}%}${HOST_COLOR}%{$reset_color%}%m] %(!.#.$) "
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%1(v|%F{green}%1v%f|) %{${fg[blue]}%}[%~]%{${reset_color}%}"

bindkey ' ' magic-space  # also do history expansion on space

#WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
WORDCHARS='*'
#------------------------------------------------
#| wordとみなす文字を羅列。
#| C-wタイプすると、このword単位で削れる。
#| $ vi /etc/conf.d/keymaps[C-w]
#| $ vi /etc/conf.d/
#| ・・・みたいな
#------------------------------------------------

bindkey -e      # emacsっぽい
#bindkey -v     # vi風味

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

alias co='git checkout'
alias be='bundle exec'
alias s='brew services'
alias sl='brew services list'

alias ppp='echo -n `pwd` | pbcopy'

setopt  auto_pushd
setopt  pushd_ignore_dups    # スタックから重複排除

setopt  correct
autoload compinit
compinit

# {0-9a-z} -> 0 1 .. 8 9 a b .. y z
setopt braceccl

HISTFILE=$HOME/.zsh-history             # 履歴をファイルに保存する
HISTSIZE=100000                         # メモリ内の履歴の数
SAVEHIST=100000                         # 保存される履歴の数
# setopt share_history                    # 複数のセッションで履歴を共有
setopt hist_ignore_all_dups             # 履歴から重複排除
setopt extended_history                 # 履歴ファイルに時刻を記録
function history-all { history -E 1 }   # 全履歴の一覧を出力する
setopt transient_rprompt                # 最新行以外の右プロンプトを消してくれるらしい
setopt extended_glob                    # ^と~使ってファイルを除外

# rbenv
if [ -d ${HOME}/.rbenv ]; then
  export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
  eval "$(rbenv init -)"
fi

# Android
if [ -d "${HOME}/Applications/android-platform-tools" ]; then
  export PATH="${HOME}/Applications/android-platform-tools:${PATH}"
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "${HOME}/.gvm/bin/gvm-init.sh" ]] && source "${HOME}/.gvm/bin/gvm-init.sh"

# python env
[[ -s "${HOME}/.pythonbrew/etc/bashrc" ]] && source "${HOME}/.pythonbrew/etc/bashrc"

# go
if [ -d "/usr/local/opt/go" ]; then
  export GOPATH="/usr/local/opt/go"
  export PATH="/usr/local/opt/go/bin:$PATH"
fi

# original commands
[ -d ${HOME}/bin ] && export PATH="${HOME}/bin:${PATH}"
[ -d ${HOME}/Applications/bin ] && export PATH="${HOME}/Applications/bin:${PATH}"

# java
if [ -e "/usr/libexec/java_home" ]; then
  export JAVA_HOME=$(/usr/libexec/java_home -v "1.8")
  export PATH=${JAVA_HOME}/bin:${PATH}
  export SBT_OPTS="$JAVA_OPTS"
  export PLAY_OPTS="$JAVA_OPTS"
fi

# jenv
if [ -d "/usr/local/opt/jenv" ]; then
  export JENV_ROOT=/usr/local/opt/jenv
  eval "$(jenv init -)"
fi

# Heroku
if [ -d /usr/local/heroku/bin/ ]; then
  export PATH="/usr/local/heroku/bin:$PATH"
fi

# docker
if [ -e "/var/run/docker.sock" ]; then
  export DOCKER_MACHINE_IP=127.0.0.1
else
  eval $(docker-machine env)
  export DOCKER_MACHINE_IP=$(docker-machine ip default)
fi

# hadoop
if [ -d "/usr/local/opt/hadoop" ]; then
  export HADOOP_HOME="/usr/local/opt/hadoop/libexec"
  export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
fi
