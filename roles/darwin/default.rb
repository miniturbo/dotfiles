include_recipe '../../helpers/recipe_helper'

node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_cookbook 'functions'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'vim'
include_cookbook 'git'
include_cookbook 'anyenv'
include_cookbook 'ruby'
