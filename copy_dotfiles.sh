#!/usr/bin/env bash

home_dir_basename=$(basename "$HOME")
default_parent_dir="home"

DOTFILES=("$HOME/.config/i3/config" "$HOME/.zshrc" "$HOME/.config/polybar/config" 
  "$HOME/.config/compton.conf" "$HOME/.config/polybar/launch.sh" "$HOME/.tmux.conf" )
for dotfile in "${DOTFILES[@]}"
do
  dotfile_basename=$(basename $dotfile)
  parent_directory=$(basename $(dirname "$dotfile"))
  if [ $home_dir_basename == $parent_directory ]; then
     parent_directory="$default_parent_dir"
  fi
  outfile_name="./$parent_directory.$dotfile_basename"
  echo "Copying $dotfile to $outfile_name"
	cp "$dotfile" "$outfile_name"
done
