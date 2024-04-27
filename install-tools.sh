#!/bin/bash

set -e 

# Function to install Homebrew
install_homebrew() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "Homebrew installed successfully."
}

# Check if Homebrew is installed and install if not
if ! command -v brew &>/dev/null; then
    install_homebrew
else
    echo "Homebrew is already installed."
fi

echo "Updating and upgrading Homebrew..."
brew update
brew upgrade
echo "Homebrew packages updated."

echo "Installing core utilities..."
brew install git ranger wget curl tmux htop tree vim neovim
echo "Core utilities installed."

echo "Installing visual applications..."
brew install --cask visual-studio-code iterm2
echo "Visual applications installed."

echo "Installing communication tools..."
brew install --cask slack microsoft-teams zoom discord
echo "Communication tools installed."

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installed."

echo "All installations complete successfully."
