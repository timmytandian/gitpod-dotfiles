#!/bin/bash

# Load nix shell env.
# This nix shell environment is already prepared by Gitpod.
source $HOME/.nix-profile/etc/profile.d/nix.sh

nix-env -iA nixpkgs.gh \
            nixpkgs.bat \
            nixpkgs.lsd \
            nixpkgs.fzf \
            nixpkgs.fd \
            nixpkgs.starship


# Configure git user name and user email
git config --global user.name "gitpod timmytandian"
git config --global user.email "m37656192+timmytandian@users.noreply.github.com"
