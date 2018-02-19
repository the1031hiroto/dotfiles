#!/bin/zsh
curl -sfLo $(dirname ${0})/zsh-completions/_docker https://raw.github.com/felixr/docker-zsh-completion/master/_docker
chmod 0700 $(dirname ${0})/zsh-completions/_*
ls -la $(dirname ${0})/zsh-completions/
