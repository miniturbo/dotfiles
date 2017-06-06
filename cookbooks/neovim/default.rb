if node[:platform] == 'darwin'
  package 'neovim/neovim/neovim'
else
  execute 'add apt repository' do
    command <<-EOF
      add-apt-repository ppa:neovim-ppa/stable
      apt update
    EOF
    not_if 'apt-cache policy | grep neovim'
    user 'root'
  end

  package 'neovim' do
    user 'root'
  end
end

directory "#{ENV['HOME']}/.config"

dotfile '.config/nvim'

execute 'install dein' do
  home = '$HOME/.local/share/dein'
  url = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
  command "curl -fsSL #{url} | zsh -s #{home}"
  not_if "test -d #{home}"
end
