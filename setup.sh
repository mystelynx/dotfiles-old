#!/bin/sh

DOT_DIR=$HOME/dotfiles

files=`find $DOT_DIR -maxdepth 2 -mindepth 2 -path '*/.git*' -prune -o -type f -print`
for file in $files
do
  dotfile=$HOME/.`basename $file`;
  echo $dotfile
  if [ -e $dotfile ]; then
    echo "$dotfile is exists. overwrite ok? [y/n] (default:y)"
    read yn
    case "$yn" in
      y|Y) echo "remove $dotfile"; rm -f $dotfile;;
      n|N) echo "skip $dotfile"; continue;;
        *) echo "remove $dotfile"; rm -f $dotfile;;
    esac
  fi
  echo create link $dotfile
  ln -s $file $dotfile
done
