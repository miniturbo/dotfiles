define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    to File.expand_path("../../../config/#{source}", __FILE__)
    user node[:user]
  end
end

define :cask do
  execute "install #{params[:name]}" do
    command "brew cask install #{params[:name]}"
    not_if "ls -1 /usr/local/Caskroom/#{params[:name]}"
  end
end
