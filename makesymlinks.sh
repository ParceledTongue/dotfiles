#!/bin/bash

############################
# makesymlinks.sh
############################

backup=~/dotfiles_old
repo_files=("$(pwd)"/files/*)

if [ -e $backup ]; then
  echo "Backup destination $backup already exists."
  echo "Please remove or rename it and try again."
  exit 1
fi
echo "Creating $backup for backup of any existing dotfiles in ~"
mkdir -p $backup
echo "...done"

for repo_file in "${repo_files[@]}"; do
  fname=$(basename "$repo_file")
  home_file=~/.$fname
  should_create=true
  if [ -e "$home_file" ]; then
    if [[ -L "$home_file" ]]; then
      existing_link=$(readlink "$home_file")
      if [[ $existing_link -ef $repo_file ]]; then
        echo "Symlink for $fname already exists."
        should_create=false
      else
        echo "Deleting old $fname symlink (pointed to $existing_link)."
        rm "$home_file"
      fi
    else
      echo "Moving $home_file to $backup."
      mv "$home_file" $backup
    fi
  fi
  if [ "$should_create" = true ]; then
    echo "Creating symlink for $fname."
    ln -s "$repo_file" "$home_file"
  fi
done

