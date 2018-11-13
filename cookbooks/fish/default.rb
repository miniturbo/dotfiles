PATH = '/usr/local/bin/fish'

package 'fish'

dotfile '.config/fish/conf.d'
dotfile '.config/fish/fishfile'
dotfile '.config/fish/functions'

execute 'install Fisher' do
  dest = '$HOME/.config/fish/fisher/functions/fisher.fish'
  command "curl https://git.io/fisher --create-dirs -sLo #{dest}"
  user node[:user]
  not_if "test -f #{dest}"
end

execute 'append fish path to /etc/shells' do
  command "echo #{PATH} | sudo tee -a /etc/shells"
  not_if "cat /etc/shells | grep #{PATH}"
end

execute 'change shell to fish' do
  command "sudo chsh -s #{PATH} #{node[:user]}"
  not_if %Q|[ "$SHELL" = "#{PATH}" ]|
end
