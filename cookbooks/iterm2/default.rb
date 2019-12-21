execute 'add homebrew/cask-versions repository' do
  command 'brew tap homebrew/cask-versions'
  not_if 'env HOMEBREW_NO_AUTO_UPDATE=1 brew tap | grep -q homebrew/cask-versions'
end

brew_cask 'iterm2-beta'

dotfile '.config/iterm2'

execute 'set PrefsCustomFolder' do
  dir = '~/.config/iterm2'
  command <<-EOF
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string '~/.config/iterm2'
    killall cfprefsd
  EOF
  not_if 'defaults read com.googlecode.iterm2.plist PrefsCustomFolder'
end

execute 'set LoadPrefsFromCustomFolder' do
  command <<-EOF
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    killall cfprefsd
  EOF
  not_if 'defaults read com.googlecode.iterm2.plist LoadPrefsFromCustomFolder'
end
