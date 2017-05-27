git "#{ENV['HOME']}/.anyenv" do
  repository 'https://github.com/riywo/anyenv.git'
end

directory "#{ENV['HOME']}/.anyenv/plugins"

[
  { name: 'anyenv-update', repository: 'https://github.com/znz/anyenv-update.git' },
  { name: 'anyenv-git', repository: 'https://github.com/znz/anyenv-git.git' }
].each do |plugin|
  git "#{ENV['HOME']}/.anyenv/plugins/#{plugin[:name]}" do
    repository plugin[:repository]
  end
end

%w(
  ndenv
  rbenv
).each do |env|
  execute "install #{env}" do
    command "anyenv install #{env}"
    not_if "anyenv version | grep #{env}"
  end
end
