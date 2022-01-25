# My Dotfiles

I am using GNU Stow to create the symlinks.

To install:
1. `$ git clone git@github.com:BradleyLWood/dotfiles.git ~/.dotfiles`
2. `$ cd ~/.dotfiles`
3. Install package with:
    a. `$ stow package` - to install specific package
    b. `$ stow *` - to install all packages
5. Prosper 

To uninstall:
a. `$ stow -D package` - to uninstall specific package
b. `$ stow -D *` - to uninstall all packages
