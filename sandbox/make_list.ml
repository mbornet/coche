
let rec mk_list n =
    if n = 0 then
      []
    else
      n :: mk_list (n - 1)


let _ = let l = mk_list 10 in
  Lists.print_int_list l ;;
