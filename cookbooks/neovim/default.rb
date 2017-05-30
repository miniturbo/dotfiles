package 'neovim/neovim/neovim'

directory "#{ENV['HOME']}/.config"

dotfile '.config/nvim'

execute 'install dein' do
  home = '$HOME/.local/share/dein'
  url = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
  command "curl -fsSL #{url} | zsh -s #{home}"
  not_if "test -d #{home}"
end
