#!/usr/bin/env zsh

if [[ ! -d $HOME/.oh-my-zsh ]]; then
  echo "Oh My ZSH must be installed before this script can run"
  exit 1
fi

shitty_absdir="$(pwd)/$(dirname $0)"
omz_theme_dir=$HOME/.oh-my-zsh/themes

rm $omz_theme_dir/idlys-* -f

for f in "${shitty_absdir}"/*.zsh-theme; do
  name=$(basename $f)
  echo "Linking ${name}"
  ln -s $f $omz_theme_dir/$name
done
