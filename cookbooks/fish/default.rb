PATH = node[:platform] == 'darwin' ? '/usr/local/bin/fish' : '/usr/bin/fish'

add_apt_repository 'fish-shell/release-3' if node[:platform] == 'ubuntu'
package 'fish'

directory "#{ENV['HOME']}/.config/fish/fisher" do
  user node[:user]
end

dotfile '.config/fish/conf.d'
dotfile '.config/fish/functions'
dotfile '.config/fish/fisher/fishfile'

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
