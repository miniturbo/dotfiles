node.reverse_merge!(user: ENV['SUDO_USER'] || ENV['USER'])

include_cookbook 'functions'
