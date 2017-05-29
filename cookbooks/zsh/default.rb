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

execute 'change shell to zsh' do
  path = '/usr/local/bin/zsh'
  command <<-EOF
    echo #{path} | sudo tee -a /etc/shells
    chsh -s #{path}
  EOF
  not_if "cat /etc/shells | grep #{path}"
end
