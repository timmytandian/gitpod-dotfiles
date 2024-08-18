#!/bin/bash

# Load nix shell env.
# This nix shell environment is already prepared by Gitpod.
source $HOME/.nix-profile/etc/profile.d/nix.sh

nix-env -iA nixpkgs.gh \
            nixpkgs.bat \
            nixpkgs.lsd \
            nixpkgs.fzf \
            nixpkgs.fd \
            nixpkgs.starship \