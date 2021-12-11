#!/usr/local/bin/python3
import os
from distro import name

# Install the homebrew package manager on macs
if name() == 'Darwin':
	print('Installing the homebrew package manager...')
	os.system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')


# Install cybervim
print('Installing the best neovim config...')
os.system('git clone https://github.com/ahoodatheguy/cybervim.git $HOME/.config/cybervim')
print('If you get errors your first time running it, try running :PackerSync')

# ZSH
print('Installing oh-my-zsh...')
os.system('sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
print('Installing syntax highlighting for zsh...')
os.system('git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting')
print('Installing completion for zsh...')
os.system('git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions')
