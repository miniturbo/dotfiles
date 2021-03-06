%w[
  asdf
  coreutils
  curl
  git
  gnupg
].each { |name| package name }

%w[
  nodejs
  ruby
].each do |name|
  execute "add #{name} plugin" do
    command <<-COMMANDS
      . $(brew --prefix asdf)/asdf.sh
      asdf plugin add #{name}
    COMMANDS
    user node[:user]
    not_if "asdf plugin list | grep #{name}"
  end
end

dotfile '.asdfrc'
