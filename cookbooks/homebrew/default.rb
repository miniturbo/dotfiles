execute 'install' do
  url = 'https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'
  command %Q|/bin/bash -c "$(curl -fsSL #{url})"|
  not_if 'which brew'
end
