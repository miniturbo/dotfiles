package 'zsh' do
  if node[:platform] == 'darwin'
    options '--without-etcdir'
  else
    user 'root'
  end
end

dotfile '.zshenv'
dotfile '.zshrc'
dotfile '.zsh'

execute 'install zplug' do
  home = '$HOME/.zsh/zplug'
  url = 'https://raw.githubusercontent.com/zplug/installer/master/installer.zsh'
  command "curl -sL --proto-redir -all,https #{url} | ZPLUG_HOME=#{home} zsh"
  not_if "test -d #{home}"
end

ZSH_PATH = node[:platform] == 'darwin' ? '/usr/local/bin/zsh' : '/usr/bin/zsh'

execute 'append zsh path to /etc/shells' do
  path = ZSH_PATH
  command "echo #{path} | sudo tee -a /etc/shells"
  not_if "cat /etc/shells | grep #{path}"
end

execute 'change shell to zsh' do
  path = ZSH_PATH
  command "chsh -s #{path} #{node[:user]}"
  not_if %Q|[ "$SHELL" = "#{path}" ]|
end
