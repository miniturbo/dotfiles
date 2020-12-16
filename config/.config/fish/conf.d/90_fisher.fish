# # pure
# set pure_color_gray (set_color brblack)

# ghq
set -g GHQ_SELECTOR peco
set -g GHQ_SELECTOR_OPTS '--prompt="ghq>"'

# peco
bind \cr 'peco_select_history (commandline -b)'
