%w(
  build-essential
  curl
  file
  git
).each { |name| package name }

execute 'install' do
  url = 'https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh'
  command <<-EOF
    yes | sh -c "$(curl -fsSL #{url})"
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    brew install gcc
  EOF
  user node[:user]
  not_if 'which brew'
end
