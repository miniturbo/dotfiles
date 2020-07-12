function _tmux_auto_rename_session
  if tmux show-environment | not grep -q TMUX_SESSION_NAME
    set -l session_name (_tmux_generate_session_name)
    tmux rename-session $session_name
    tmux set-environment TMUX_SESSION_NAME $session_name
  end
end
