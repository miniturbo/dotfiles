cask 'iterm2'

file = "#{ENV['HOME']}/Library/Preferences/com.googlecode.iterm2.plist"
remote_file file do
  not_if "test -f #{file}"
end
