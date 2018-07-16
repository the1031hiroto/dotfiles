# dotfiles

https://dotfiles.github.io/

## clone!

```shell
git clone git@github.com:shuji-koike/dotfiles.git ~/.dotfiles
```

## link!

```shell
ln -sf .dotfiles/zsh .zsh
ln -sf .zsh/.zshrc
ln -sf .dotfiles/git/.gitconfig
ln -sf .dotfiles/git/.gitignore
ln -sf .dotfiles/git/.tigrc
ln -sf .dotfiles/atom .atom
ln -sf .dotfiles/screen/.screenrc
ln -sf .dotfiles/tmux/.tmux.conf
ln -sf .dotfiles/vim/.vimrc

touch .zshrc.local

chmod 400 .zshrc
```

## that's it!

:trollface:


## want more?

### atom

``` sh
apm stars --install
```
