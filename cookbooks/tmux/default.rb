package 'tmux'

dotfile '.tmux.conf'

git_pull "#{ENV['HOME']}/.tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
  user node[:user]
end
