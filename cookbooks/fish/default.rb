fish_path =
  case `uname -m`.strip
  when 'arm64' then '/opt/homebrew/bin/fish'
  else '/usr/local/bin/fish'
  end

package 'fish'

dotfile '.config/fish/conf.d/00_env.fish'
dotfile '.config/fish/conf.d/10_color.fish'
dotfile '.config/fish/conf.d/20_alias.fish'
dotfile '.config/fish/conf.d/30_tool.fish'
dotfile '.config/fish/conf.d/90_fisher.fish'
dotfile '.config/fish/fish_plugins'
dotfile '.config/fish/functions/_set_path.fish'
dotfile '.config/fish/functions/_tmux_auto_rename_session.fish'
dotfile '.config/fish/functions/_tmux_generate_session_name.fish'

execute 'append fish path to /etc/shells' do
  command "echo #{fish_path} | sudo tee -a /etc/shells"
  not_if "cat /etc/shells | grep #{fish_path}"
end

execute 'change shell to fish' do
  command "sudo chsh -s #{fish_path} #{node[:user]}"
  not_if %Q|[ "$SHELL" = "#{fish_path}" ]|
end

execute 'install fisher' do
  command %q[fish -c 'curl -sL https://git.io/fisher | source && fisher update']
  not_if "test -f #{ENV['HOME']}/.config/fish/functions/fisher.fish"
end
