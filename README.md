# NeoVim config

My vim config mainly designed to be used with neovim, with vimscript compatability at the top layer for use in tools such as ideavim.

# Usage
The config needs to be included in different ways depending on the environment.

## NeoVim

1. Clone the repository into your config directory (commonly `~/.config`).
2. Rename the directory to `nvim`.
3. Delete `.git` and `.gitignore`.

## Jetbrains

1. Follow all 3 steps of the NeoVim section.
2. Source 'vim/idea-init.vim' in '.ideavimrc'.
<br>Probably looks something like this `source ~/.config/nvim/vim/idea-init.vim`.
