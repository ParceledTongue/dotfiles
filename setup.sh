#!/bin/bash

############
# setup.sh #
############

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

zsh_custom=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# powerlevel10k
p10k_path=$zsh_custom/themes/powerlevel10k
if [ ! -d "$p10k_path" ]; then
  echo "Installing powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k_path"
fi

# zsh-syntax-highlighting
highlight_path=$zsh_custom/plugins/zsh-syntax-highlighting
if [ ! -d "$highlight_path" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$highlight_path"
fi

# zsh-autosuggestions
auto_path=$zsh_custom/plugins/zsh-autosuggestions
if [ ! -d "$auto_path" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$auto_path"
fi

# Share vim config with neovim
# (via https://vi.stackexchange.com/a/15548)
shared_vim_config=~/.config/nvim/init.vim
if [ ! -e "$shared_vim_config" ]; then
  echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" > "$shared_vim_config"
  echo "let &packpath=&runtimepath" >> "$shared_vim_config"
  echo "source ~/.vimrc" >> "$shared_vim_config"
fi

