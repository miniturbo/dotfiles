package 'mas'

execute 'install xcode' do
  app_id = '497799835'
  command "mas install #{app_id}"
  not_if "mas list | grep #{app_id}"
end
