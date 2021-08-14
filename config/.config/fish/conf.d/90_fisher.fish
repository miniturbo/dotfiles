# decors/fish-ghq
set -g GHQ_SELECTOR peco
set -g GHQ_SELECTOR_OPTS '--prompt="ghq>"'

# oh-my-fish/plugin-peco
bind \cr 'peco_select_history (commandline -b)'
