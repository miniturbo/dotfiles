cask 'iterm2'

dotfile '.config/iterm2'

execute 'set PrefsCustomFolder' do
  command <<-EOS
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string '~/.config/iterm2'
    killall cfprefsd
  EOS
  not_if 'defaults read com.googlecode.iterm2.plist PrefsCustomFolder'
end

execute 'set LoadPrefsFromCustomFolder' do
  command <<-EOS
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
    killall cfprefsd
  EOS
  not_if 'defaults read com.googlecode.iterm2.plist LoadPrefsFromCustomFolder'
end
