#!/bin/bash

# Define current directory and make a temporary directory
TMPDIR=$(mktemp -d)
CURRENT=$PWD

# Go to the temp dir to perform execute each installation task.
# Each installation task may produce some files (e.g. unzipping
# or downloading files), so we can remove these unnecessary
# files easily later.
cd $TMPDIR

# Define a list of installation scripts to exclude
EXCLUDES=("deno_configure.sh" "gcloud_cli_install.sh")

# Run each installation script inside the "scripts" folder.
# Gitpod clones this repo into "$HOME/.dotfiles" folder in the
# Gitpod development instance.
for script in ~/.dotfiles/scripts/*; do
  script_name=$(basename "$script")
  
  # Check if the script is in the exclusion list
  if [[ " ${EXCLUDES[@]} " =~ " ${script_name} " ]]; then
    continue
  fi

  bash "$script"
done


# Go back to the initial directory
cd $CURRENT

# Clean up the temp dir
rm -rf $TMPDIR
