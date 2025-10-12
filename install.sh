echo 'set runtimepath+=~/.vim_config
source ~/.vim_config/init.vim
source ~/.vim_config/plugin_config.vim
source ~/.vim_config/plugin_config_fzf.vim'>~/.vimrc

mkdir -p ~/.config/nvim/

echo 'set runtimepath^=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc'>~/.config/nvim/init.vim
