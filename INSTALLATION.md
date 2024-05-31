# Setting up the dotfiles symlink
```bash
git clone git@github.com:nicolaslauzon/dotfiles ~/dotfiles
cd ~/dotfiles
sudo apt install stow
stow .
```

# ZSH
```bash
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Vim
1.```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Open vim and enter `:PlugInstall`
