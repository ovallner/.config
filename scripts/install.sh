/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 1. Set Identity Configuration
# Replace these with your actual info
GIT_USER="ovallner"
GIT_EMAIL="ovallner@gmail.com"

echo "Configuring Git global settings..."
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"

# 2. Recommended Global Settings
git config --global core.editor "vim"      # Set your preferred editor
git config --global init.defaultBranch main # Standardize initial branch name

# 3. Verify Configuration
echo "Git configuration complete:"
git config --list --show-origin

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying .zshenv ..."
cp ./ext_configs/.zshenv ~/.zshenv
echo "Done copying .zshenv\n"

echo "Copying agnoster theme modifications for oh-my-zsh..."
cp ./ext_configs/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
echo "Done copying agnoster theme\n"

brew install neovim

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash

nvm install 24

brew install python@3.14

curl -fsSL https://opencode.ai/install | bash
