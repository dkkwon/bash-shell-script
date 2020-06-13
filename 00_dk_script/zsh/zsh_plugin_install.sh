#! /bin/bash

# zsh
# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
sudo apt install zsh

# oh-my-zsh
# https://github.com/ohmyzsh/ohmyzsh
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dir_zsh_plugin=${ZSH_CUSTOM1:-$ZSH/custom}/plugins
echo "dir_zsh_plugin: ${dir_zsh_plugin}"

# update plugin name to ~/.zshrc
# run 'source ~/.zshrc' after updating

# https://github.com/zsh-users/zsh-completions
# vi ~/.zshrc
#  autoload -U compinit && compinit
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/djui/alias-tips
(cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins && git clone https://github.com/djui/alias-tips.git)

# https://github.com/wting/autojump
sudo apt install autojump

# https://github.com/junegunn/fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install