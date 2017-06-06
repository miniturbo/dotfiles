include_recipe '../../helpers/recipe_helper'

node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_role 'base'
include_cookbook 'zsh'
