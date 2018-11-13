function _deduplicate
  set -l list
  for i in $argv
    not contains $i $list; and set list $list $i
  end
  echo $list | tr ' ' \n
end
