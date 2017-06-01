alias cp="nocorrect cp -i"
alias git="nocorrect git"
alias heroku="nocorrect heroku"
alias l.="ls -d .*"
alias less="less -R"
alias ll="ls -lh"
alias mv="nocorrect mv -i"
alias rm="rm -i"
alias tailf="tail -f"
alias vi="nocorrect vim"

# color ls
case $(uname) in
  Darwin) alias ls="ls -FG" ;;
  *)      alias ls="ls --color=auto -F" ;;
esac

# colordiff
if type colordiff > /dev/null 2>&1; then
  alias diff='colordiff'
fi

# Homebrew
alias brew="env PATH=${PATH/${HOME}\/\.anyenv\/envs\/*env\/shims:/} brew"

# Ruby
alias be="nocorrect bundle exec --"
alias serve="ruby -run -e httpd -- --bind-address=0.0.0.0 --port=3000 ."

# Perl
alias ce="nocorrect carton exec --"
