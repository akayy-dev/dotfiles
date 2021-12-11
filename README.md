# My personal configuration

This serves as the repo for dotfiles, if you're looking for my neovim configuration, you can find it [here](https://github.com/ahoodatheguy/cybervim), although the this repos install script *does* automatically clone said configuration to it's proper location.

Previously, the config could be installed by simply cloning it to the `~/.config` folder. While this was nice, it raised problems like how to manage files that don't belong there, such as `.zshrc` or `.tmux.conf`.
The method of solving this is simple, now this config is cloned to the `~/.dotfiles` folder and configurations are symlinked to their proper locations using [GNU Stow](https://www.gnu.org/software/stow/).

# The install script
When you clone this repo, you'll find a script named `install.py`. This is quite useful because there are certain programs or configuraitons that can'`


**NOTE:** You might need to run `chmod +x install.py` to get the script to work.
