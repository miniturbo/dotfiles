package 'luajit' do
  options '--HEAD'
end

package 'neovim' do
  options '--HEAD'
end

dotfile '.config/nvim/autoload'
dotfile '.config/nvim/config'
dotfile '.config/nvim/ftdetect'
dotfile '.config/nvim/init.vim'
dotfile '.config/vscode/nvim/init.vim'

execute 'install dein' do
  home = '$HOME/.local/share/dein'
  url = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
  command "curl -fsSL #{url} | bash -s #{home}"
  user node[:user]
  not_if "test -d #{home}"
end
