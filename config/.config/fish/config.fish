# fisher
for file in $fisher_path/conf.d/*.fish
  builtin source $file ^ /dev/null
end
