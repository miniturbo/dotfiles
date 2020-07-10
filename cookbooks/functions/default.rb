define :cask do
  execute "install #{params[:name]}" do
    command "brew cask install #{params[:name]}"
    not_if "ls -1 /usr/local/Caskroom/#{params[:name]}"
  end
end

define :dotfile do
  src = File.join(ENV['HOME'], params[:name]) 
  dst = File.expand_path("../../../config/#{params[:name]}", __FILE__)

  directory File.expand_path('..', src) do
    user node[:user]
  end

  link src do
    to dst
    user node[:user]
  end
end
