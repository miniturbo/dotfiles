package 'tmux'

if node[:platform] == 'darwin'
  package 'reattach-to-user-namespace' do
    options '--with-wrap-launchctl --with-wrap-pbcopy-and-pbpaste'
  end
end

dotfile '.tmux.conf'
dotfile '.tmux'

git_pull "#{ENV['HOME']}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
  user node[:user]
end
