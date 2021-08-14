execute 'install HackGen' do
  url = 'https://github.com/yuru7/HackGen/releases/download/v2.4.1/HackGen_v2.4.1.zip'
  command <<-EOS
    curl -sL -o HackGen.zip #{url}
    unzip -j -d HackGen HackGen.zip
    cp HackGen/*.ttf $HOME/Library/Fonts/
    rm -rf HackGen*
  EOS
  cwd '/tmp'
  user node[:user]
  not_if 'test -f $HOME/Library/Fonts/HackGen-Regular.ttf'
end
