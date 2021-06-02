#!/bin/bash

############################
# makesymlinks.sh
############################

backup=~/dotfiles_old
repo_files=($(pwd)/files/*)

if [ -e $backup ]; then
  echo "Backup destination $backup already exists."
  echo "Please remove or rename it and try again."
  exit 1
fi
echo "Creating $backup for backup of any existing dotfiles in ~"
mkdir -p $backup
echo "...done"

for repo_file in ${repo_files[@]}; do
  fname=$(basename "$repo_file")
  home_file=~/.$fname
  if [ -e "$home_file" ]; then
    echo "Moving $home_file to $backup."
    mv "$home_file" $backup
  fi
  echo "Creating symlink for $fname."
  ln -s "$repo_file" "$home_file"
done

