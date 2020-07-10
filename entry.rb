node.validate! do
  {
    cookbooks: array_of(string)
  }
end

node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_recipe './helpers/recipe_helper'

include_cookbook 'functions'

node[:cookbooks].each { |c| include_cookbook c }
