function _tmux_generate_session_name
  # decide session name
  set -l name
  if git rev-parse 2> /dev/null
    set name (basename (git rev-parse --show-toplevel))
  else
    set name (basename (pwd))
  end

  # fix duplicated name
  set -l dups (tmux list-sessions -F '#{session_name}' | string match -r "^$name(?:\|\d+)?\$")
  if test (count $dups) -gt 0
    set -l n 0
    if test (count $dups) -gt 1
      set n (string split ' ' $dups | cut -d \| -f 2 | sort -n | tail -1)
    end
    set name "$name|"(math $n + 1)
  end

  echo (string replace '.' '_' $name)
end
