#!/bin/bash

CURRENT=$PWD

# Make the font directory if it does not exist
mkdir -p ~/.local/share/fonts

# Use curl to download
cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/JetBrainsMono/Ligatures/Regular/JetBrainsMonoNerdFont-Regular.ttf

cd $CURRENT