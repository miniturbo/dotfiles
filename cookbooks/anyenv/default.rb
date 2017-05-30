ANYENV_ROOT = "#{ENV['HOME']}/.anyenv"

git ANYENV_ROOT do
  repository 'https://github.com/riywo/anyenv.git'
end

directory "#{ANYENV_ROOT}/plugins"

[
  { name: 'anyenv-update', repository: 'https://github.com/znz/anyenv-update.git' },
  { name: 'anyenv-git', repository: 'https://github.com/znz/anyenv-git.git' }
].each do |plugin|
  git "#{ANYENV_ROOT}/plugins/#{plugin[:name]}" do
    repository plugin[:repository]
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
    not_if %Q!test -d #{ANYENV_ROOT}/envs/#{env}!
  end
end
