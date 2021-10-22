# vim-configs
This is a vim config for working on C/C++ projects in vim. Please, note this is geared towards using in terminals for unix-like (macOS & Linux) OSes. So, this might not work well in windows or GUI vims.

## Environments tested in include:
- macOS Big Sur + iTerm + tmux
- Ubuntu 16.04 + GNOME Terminal + tmux

## To install run the following one by one.
`git clone https://github.com/or-nob/vim-configs ~/.vim_config`<br/>
`cd ~/.vim_config`<br/>
`./install.sh`<br/>
`source ~/.vim_config`<br/>
`vim .`<br/>

Then, from vim command line:
`:PluginInstall`<br/>

PS: install clang-format for `vim-clang-format` plugin to work.
