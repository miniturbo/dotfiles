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
    path = "#{ANYENV_ROOT}/bin:$PATH"
    command %Q|PATH=#{path} anyenv install #{env}|
    not_if %Q!PATH=#{path} anyenv version | grep #{env}!
  end
end
