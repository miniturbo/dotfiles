case node[:platform]
when 'darwin'
  package 'neovim/neovim/neovim'
when 'ubuntu'
  add_apt_repository 'neovim-ppa/unstable'
  package 'neovim'
end

directory "#{ENV['HOME']}/.config" do
  user node[:user]
end

dotfile '.config/nvim'

execute 'install dein' do
  home = '$HOME/.local/share/dein'
  url = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
  command "curl -fsSL #{url} | bash -s #{home}"
  user node[:user]
  not_if "test -d #{home}"
end
