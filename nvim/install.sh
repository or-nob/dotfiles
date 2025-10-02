echo 'set runtimepath+=~/.dotfiles/nvim/
source ~/.dotfiles/nvim/init.vim
source ~/.dotfiles/nvim/plugin_config.vim
source ~/.dotfiles/nvim/plugin_config_fzf.vim'>~/.vimrc

mkdir -p ~/.config/nvim/

echo 'set runtimepath^=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc'>~/.config/nvim/init.vim
