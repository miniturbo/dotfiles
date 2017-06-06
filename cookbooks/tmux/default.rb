package 'tmux' do
  user 'root' unless node[:platform] == 'darwin'
end

if node[:platform] == 'darwin'
  package 'reattach-to-user-namespace' do
    options '--with-wrap-launchctl --with-wrap-pbcopy-and-pbpaste'
  end
end

dotfile '.tmux.conf'
dotfile '.tmux'

git "#{ENV['HOME']}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
end
