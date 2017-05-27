package 'macvim' do
  options '--with-override-system-vim'
end

dotfile '.vimrc'
dotfile '.vim'

execute 'install dein' do
  home = '$HOME/.vim/dein'
  url = 'https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh'
  command "curl -sL --proto-redir -all,https #{url} | zsh -s #{home}"
  not_if "test -d #{home}"
end
