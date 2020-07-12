package 'neovim/neovim/neovim'

dotfile '.config/nvim/autoload'
dotfile '.config/nvim/config'
dotfile '.config/nvim/ftdetect'
dotfile '.config/nvim/init.vim'

execute 'install dein' do
  home = '$HOME/.local/share/dein'
  url = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
  command "curl -fsSL #{url} | bash -s #{home}"
  user node[:user]
  not_if "test -d #{home}"
end
