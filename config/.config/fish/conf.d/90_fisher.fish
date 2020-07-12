# # pure
# set pure_color_gray (set_color brblack)

# ghq
set -g GHQ_SELECTOR peco
set -g GHQ_SELECTOR_OPTS '--prompt="ghq>"'

# peco
bind \cr 'peco_select_history (commandline -b)'

# fisher
set -g fisher_path $HOME/.config/fish/fisher

set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..-1]
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..-1]

for file in $fisher_path/conf.d/*.fish
  builtin source $file 2> /dev/null
end

if not functions -q fisher
  curl https://git.io/fisher --create-dirs -sLo $HOME/.config/fish/fisher/functions/fisher.fish
  fish -c fisher
end
