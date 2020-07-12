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

define :git_pull, repository: nil do
  if run_command("test -d #{params[:name]}", error: false).exit_status != 0
    execute "git clone from #{params[:repository]} to #{params[:name]}" do
      command "git clone #{params[:repository]} #{params[:name]}"
      user params[:user]
    end
  else
    cmd = <<-EOS
      cd #{params[:name]}
      local=$(git log -1 HEAD | head -1 | awk '{print $2}')
      remote=$(git ls-remote origin HEAD | head -1 | awk '{print $1}')
      [ "$local" = "$remote" ]
    EOS
    if run_command(cmd, error: false).exit_status != 0
      execute "git pull from #{params[:repository]} to #{params[:name]}" do
        command 'git pull'
        cwd params[:name]
        user params[:user]
      end
    end
  end
end
