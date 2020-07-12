function _set_path -a new_path
  not contains $new_path $PATH && set PATH $new_path $PATH
end
