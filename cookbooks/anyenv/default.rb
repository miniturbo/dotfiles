anyenv_root_path = "#{ENV['HOME']}/.anyenv"
anyenv_config_path = "#{ENV['HOME']}/.config/anyenv"

package 'anyenv'

execute 'initialize install manifest directory' do
  command 'anyenv install --force-init'
  user node[:user]
  not_if "test -d #{anyenv_config_path}"
end

git_pull "#{anyenv_root_path}/plugins/anyenv-update" do
  repository 'https://github.com/znz/anyenv-update.git'
  user node[:user]
end

%w(
  nodenv
  rbenv
).each do |env|
  execute "install #{env}" do
    command <<-EOS
      export PATH="#{anyenv_root_path}/bin:$PATH"
      anyenv init -
      anyenv install #{env}
    EOS
    user node[:user]
    not_if "test -d #{ENV['HOME']}/.anyenv/envs/#{env}"
  end
end
