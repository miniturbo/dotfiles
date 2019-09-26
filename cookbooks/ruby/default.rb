packages =
  case node[:platform]
  when 'darwin'
    %w(libffi libyaml openssl)
  when 'ubuntu'
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
    )
  end

packages.each { |name| package name }

dotfile '.gemrc'
