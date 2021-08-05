#!/bin/sh

echo "Asking super user privilege..."

sudo -s

echo "Setting up your Mac..."

# Install XCode Dev Tools
sudo xcode-select --install

# Copy .ssh files from iCloud
cp -R "$HOME/Library/Mobile Documents/com~apple~CloudDocs/.ssh" ~/

# Check for Oh My Zsh and install it if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
  # After Installing Continue Running Script
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Set default MySQL root password and auth type
# mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Install PHP extensions with PECL
# pecl install imagick memcached redis swoole

# Install global Composer packages
composer global require laravel/installer laravel/valet beyondcode/expose

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Clone Github repositories
./clone.sh

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Symlink the Mackup config file to the home directory
rm -rf $HOME/.mackup.cfg
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

rm -rf $HOME/.oh-my-zsh/themes/minimal.zsh-theme
ln -s $HOME/.dotfiles/minimal.zsh-theme $HOME/.oh-my-zsh/themes/minimal.zsh-theme

# Set macOS preferences - we will run this last because this will reload the shell
source .macos
