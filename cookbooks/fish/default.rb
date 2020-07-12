fish_path = '/usr/local/bin/fish'

package 'fish'

dotfile '.config/fish/conf.d'
dotfile '.config/fish/fishfile'
dotfile '.config/fish/functions'

execute 'append fish path to /etc/shells' do
  command "echo #{fish_path} | sudo tee -a /etc/shells"
  not_if "cat /etc/shells | grep #{fish_path}"
end

execute 'change shell to fish' do
  command "sudo chsh -s #{fish_path} #{node[:user]}"
  not_if %Q|[ "$SHELL" = "#{fish_path}" ]|
end
