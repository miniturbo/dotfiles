alias cp 'cp -i'
alias mv 'mv -i'
alias rm 'rm -i'
alias vi vim
alias less 'less -MR'
alias tailf 'tail -f'

# ls
if functions -q ls
  functions -c ls _original_ls
else
  alias _original_ls ls
end

alias ls '_original_ls -F'

# tools
type -q nvim; and alias vim nvim
type -q colordiff; and alias diff colordiff
type -q tmux; and type -q direnv; alias tmux 'direnv exec / tmux'
