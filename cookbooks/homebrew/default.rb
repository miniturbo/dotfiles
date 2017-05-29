execute 'install' do
  url = 'https://raw.githubusercontent.com/Homebrew/install/master/install'
  command %Q|TRAVIS=1 ruby -e "$(curl -fsSL #{url})"|
  not_if 'which brew'
end
