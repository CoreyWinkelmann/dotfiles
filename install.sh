cd ~/dotfiles

git clone git@github.com:cawinkelmann/dotfiles.git

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

cd ~/dotfiles

git submodule init
git submodule update

rm -rf ~/.vim
rm -f ~/.vimrc
rm -f ~/.gitconfig
rm -f ~/.zshrc

ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc


cp ~/dotfiles/.oh-my-zsh/themes/cagenix.zsh-theme ~/.oh-my-zsh/themes/
