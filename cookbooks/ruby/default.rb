
if node[:platform] == 'darwin'
  %w(libffi libyaml openssl).each { |name| package name }
else
  %w(
    autoconf
    bison
    build-essential
    libffi-dev
    libgdbm-dev
    libgdbm3
    libncurses5-dev
    libreadline6-dev
    libssl-dev
    libyaml-dev
    zlib1g-dev
  ).each do |name|
    package name do
      user 'root'
    end
  end
end

dotfile '.gemrc'
