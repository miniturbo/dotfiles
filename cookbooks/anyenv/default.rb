ANYENV_ROOT = "#{ENV['HOME']}/.anyenv"

[
  {
    path: ANYENV_ROOT,
    repository: 'https://github.com/riywo/anyenv.git'
  },
  {
    path: "#{ANYENV_ROOT}/plugins/anyenv-update",
    repository: 'https://github.com/znz/anyenv-update.git'
  }
].each do |g|
  git_pull g[:path] do
    repository g[:repository]
    user node[:user]
  end
end

%w(
  ndenv
  rbenv
).each do |env|
  execute "install #{env}" do
    command <<-EOF
      #{ANYENV_ROOT}/bin/anyenv init -
      #{ANYENV_ROOT}/bin/anyenv install #{env}
    EOF
    user node[:user]
    not_if %Q!test -d #{ANYENV_ROOT}/envs/#{env}!
  end
end
