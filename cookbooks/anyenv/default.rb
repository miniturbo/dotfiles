ANYENV_DEFINITION_ROOT = "#{ENV['HOME']}/.config/anyenv"
ANYENV_ROOT = "#{ENV['HOME']}/.anyenv"

case node[:platform]
when 'darwin'
  package 'anyenv'
else
  git_pull ANYENV_ROOT do
    repository 'https://github.com/anyenv/anyenv.git'
    user node[:user]
  end
end

execute 'initialize install manifest directory' do
  command "#{ANYENV_ROOT}/bin/anyenv install --force-init"
  user node[:user]
  not_if "test -d #{ANYENV_DEFINITION_ROOT}"
end

git_pull "#{ANYENV_ROOT}/plugins/anyenv-update" do
  repository 'https://github.com/znz/anyenv-update.git'
  user node[:user]
end

%w(
  nodenv
  rbenv
).each do |env|
  execute "install #{env}" do
    command <<-EOF
      #{ANYENV_ROOT}/bin/anyenv init -
      #{ANYENV_ROOT}/bin/anyenv install #{env}
    EOF
    user node[:user]
    not_if "test -d #{ENV['HOME']}/.anyenv/envs/#{env}"
  end
end
