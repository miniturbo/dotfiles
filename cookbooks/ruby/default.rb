packages = %w[openssl@1.1 readline]

packages.each { |name| package name }

dotfile '.gemrc'
