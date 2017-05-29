package 'zsh' do
  options '--without-etcdir'
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

file '/etc/shells' do
  action :edit
  block do |content|
    content << "/usr/local/bin/zsh\n"
  end
end

execute 'change shell to zsh' do
  command 'chsh -s /usr/local/bin/zsh'
  not_if 'echo $0 | grep zsh'
end
