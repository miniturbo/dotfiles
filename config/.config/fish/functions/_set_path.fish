function _set_path -a new_path
  not contains $new_path $PATH; and set PATH $new_path $PATH
end
