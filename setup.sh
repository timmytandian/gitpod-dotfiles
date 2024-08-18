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
EXCLUDES=("placeholder.sh" "terraform_configure.sh")

time {
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

# Symlink dotfiles
# Why I do this? -> See reference below.
# https://www.gitpod.io/docs/configure/user-settings/dotfiles#how-to-install-symlinks-from-dotfiles-when-using-a-custom-installation-script
current_dir="$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"
dotfiles_source="${current_dir}/home_files"

while read -r file; do

    relative_file_path="${file#"${dotfiles_source}"/}"
    target_file="${HOME}/${relative_file_path}"
    target_dir="${target_file%/*}"

    if test ! -d "${target_dir}"; then
        mkdir -p "${target_dir}"
    fi

    printf 'Installing dotfiles symlink %s\n' "${target_file}"
    ln -sf "${file}" "${target_file}"

done < <(find "${dotfiles_source}" -type f)

# Clean up the temp dir
rm -rf $TMPDIR
}