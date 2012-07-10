#! /bin/sh

if [ $# != 1 ]; then
  echo "specify 1 file-name"
  exit 1
fi

if [ -e $HOME/dotfiles/zsh/zaw/sources/$1 ]; then
  echo "zaw-source $1 exists. overwrite ok? [y/n] (default:y)"
  read yn
  case "$yn" in
    y|Y) echo "remove $1"; rm -f $HOME/dotfiles/zsh/zaw/sources/$1;;
    n|N) echo "skip $1"; exit 1;;
      *) echo "remove $1"; rm -f $HOME/dotfiles/zsh/zaw/sources/$1;;
  esac
fi
echo create link $1
ln -s $HOME/dotfiles/zsh/zaw-sources/$1 $HOME/dotfiles/zsh/zaw/sources/
