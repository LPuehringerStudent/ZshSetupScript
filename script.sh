#!/bin/bash

# Install dependencies
sudo apt update && sudo apt install -y zsh curl git

# Install Oh My Zsh (unattended)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change default shell to zsh
chsh -s "$(which zsh)"

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install plugins: zsh-autosuggestions and zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Overwrite ~/.zshrc with desired content
cat << 'EOF' > ~/.zshrc
# Disable instant prompt warning by setting it to quiet
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Set Oh My Zsh path
export ZSH="$HOME/.oh-my-zsh"

# Pick theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Source Oh My Zsh (prompt loaded here)
source $ZSH/oh-my-zsh.sh

# User configuration (keep this section intact)
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# export EDITOR='vim'

# Set personal aliases, overriding those provided by Oh My Zsh libs
# alias zshconfig="mate ~/.zshrc"

# Powerlevel10k theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Startup commands: run neofetch *only after prompt is loaded*
if [[ $- == *i* ]]; then
  neofetch
fi
EOF

echo "Installation complete! Log out and back in to see changes."
echo "Note: To properly display Powerlevel10k, install a Nerd Font or Powerline font."

