#!/usr/bin/env zsh

if [[ ! -d $HOME/.oh-my-zsh ]]; then
  echo "Oh My ZSH must be installed before this script can run"
  exit 1
fi

shitty_absdir="$(pwd)/$(dirname $0)"

for f in "${shitty_absdir}"/*.zsh-theme; do
  name=$(basename $f)
  echo "Linking ${name}"
  ln -s $f $HOME/.oh-my-zsh/themes/$name
done
