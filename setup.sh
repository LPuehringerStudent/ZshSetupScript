#!/bin/bash

# Install dependencies
sudo apt update && sudo apt install -y zsh curl git

# Download and install Oh My Zsh (unattended mode)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change default shell to zsh
chsh -s $(which zsh)

# Configure theme (agnoster)
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Enable plugins (git, sudo, zsh-autosuggestions)
sed -i 's/plugins=(git)/plugins=(git sudo zsh-autosuggestions)/' ~/.zshrc

# Optional: Install Powerline fonts for theme symbols
# sudo apt install -y fonts-powerline

echo "Installation complete! Log out and back in to see changes."
echo "Note: If using the agnoster theme, install Powerline fonts for proper symbol display."
