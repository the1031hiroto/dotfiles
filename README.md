# dotfiles
My dotfiles forked from mazgi/dotfiles

## clone!

```
git clone git@github.com:shuji-koike/dotfiles.git ~/.dotfiles

# git clone git@github.com:shuji-koike/dotfiles.git ~/Documents/github.com/shuji-koike/dotfiles
# ln -s Documents/github.com/shuji-koike/dotfiles .dotfiles
```

## link!

```
# rm .gitconfig .gitignore .screenrc .tmux.conf .vim .vimrc .zshrc

ln -s .dotfiles/git/.gitconfig
ln -s .dotfiles/git/.gitignore
ln -s .dotfiles/screen/.screenrc
ln -s .dotfiles/tmux/.tmux.conf
ln -s .dotfiles/vim/.vim
ln -s .dotfiles/vim/.vimrc
ln -s .dotfiles/zsh/.zshrc
```

## that's it!
