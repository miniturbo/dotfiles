%w[
  gmp
  libyaml
  openssl@3
  readline
].each { |name| package name }

dotfile '.gemrc'
