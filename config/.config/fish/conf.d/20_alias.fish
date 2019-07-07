alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -i'
alias vi vim

alias less 'less -iMR'
alias tailf 'tail -f'

# ls
if functions -q ls
  functions -c ls _original_ls
else
  alias _original_ls ls
end

alias ls '_original_ls -F'

# tools
type -q colordiff && alias diff colordiff
type -q nvim && alias vim nvim
type -q tmux && type -q direnv && alias tmux 'direnv exec / tmux'
