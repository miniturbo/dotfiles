package 'tmux'

dotfile '.config/tmux'

git_pull "#{ENV['HOME']}/.local/share/tmux/plugins/tpm" do
  repository 'https://github.com/tmux-plugins/tpm'
  user node[:user]
end
