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

# Docker
command -v docker-machine >/dev/null 2>&1 && eval $(docker-machine env 2>/dev/null)

# hadoop
if [ -d "/usr/local/opt/hadoop" ]; then
  export HADOOP_HOME="/usr/local/opt/hadoop/libexec"
  export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
fi
