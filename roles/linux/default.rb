include_recipe '../../helpers/recipe_helper'

node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_role 'base'
include_cookbook 'fish'
include_cookbook 'tmux'
include_cookbook 'neovim'
include_cookbook 'git'
include_cookbook 'anyenv'
