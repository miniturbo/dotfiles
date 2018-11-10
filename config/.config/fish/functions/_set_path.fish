function _set_path -a new_path
  contains $new_path $PATH; or set PATH $new_path $PATH
end
