zsh_path =
  case `uname -m`.strip
  when 'arm64' then '/opt/homebrew/bin/zsh'
  else '/usr/local/bin/zsh'
  end

package 'zsh'

dotfile '.zshenv'
dotfile '.config/zsh'

execute 'append zsh path to /etc/shells' do
  command "echo #{zsh_path} | sudo tee -a /etc/shells"
  not_if "cat /etc/shells | grep #{zsh_path}"
end

execute 'change shell to zsh' do
  command "sudo chsh -s #{zsh_path} #{node[:user]}"
  not_if %Q|[ "$SHELL" = "#{zsh_path}" ]|
end