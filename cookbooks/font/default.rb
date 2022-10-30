execute 'tap homebrew/cask-fonts' do
  command 'brew tap homebrew/cask-fonts'
  not_if 'brew tap | grep homebrew/cask-fonts'
end

%w[
  font-hackgen
  font-hackgen-nerd
].each do |name|
  package name do
    not_if "brew list | grep #{name}"
  end
end