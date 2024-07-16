## My Dotfiles

Welcome to my dotfiles repository! This repository contains my personal configurations for various applications and tools like Hyprland, Shell configs ...

## Getting Started

Follow these steps to clone the repository and set up the dotfiles:

### Clone the Repository

First, clone the repository to your home directory:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git $HOME/.dotfiles
```

### Enter the Directory

Navigate to the newly cloned directory:

```bash
cd $HOME/.dotfiles
```

### Apply the dotfiles

Install `stow` using your distro's package manager.

For Arch : 

```bash
sudo pacman -Syu stow
```

Create the symlinks :

```bash
stow .
```

Now, the corresponding symlinks have been successfully created.

### Remove dotfiles

To remove the dotfiles , do :

```bash
cd $HOME/.dotfiles
stow -D .
cd .. ; rm -rf .dotfiles/
```
