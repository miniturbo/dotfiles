case node[:platform]
when 'darwin'
  package 'neovim/neovim/neovim'
else
  execute 'add apt repository' do
    command <<-EOF
      add-apt-repository -y ppa:neovim-ppa/unstable
      apt update -y
    EOF
    not_if 'apt-cache policy | grep neovim'
  end

  package 'neovim'
end

directory "#{ENV['HOME']}/.config" do
  user node[:user]
end

dotfile '.config/nvim'

execute 'install dein' do
  home = '$HOME/.local/share/dein'
  url = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
  command "curl -fsSL #{url} | zsh -s #{home}"
  user node[:user]
  not_if "test -d #{home}"
end
