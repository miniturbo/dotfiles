alias ll="ls -lh"
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias vi="vim"
alias less="less -R"
alias tailf="tail -f"

# ls
case $(uname) in
  Darwin) alias ls="ls -FG" ;;
  *)      alias ls="ls -F --color=auto --group-directories-first" ;;
esac

# gls
if type gls > /dev/null; then
  alias ls="gls -F --color=auto --group-directories-first"
fi

# colordiff
if type colordiff > /dev/null; then
  alias diff="colordiff"
fi

# bundler
if type bundle > /dev/null; then
  alias be="bundle exec --"
fi

# homebrew
if type brew > /dev/null; then
  alias brew="env PATH=${PATH/${HOME}\/\.anyenv\/envs\/*env\/shims:/} brew"
fi
