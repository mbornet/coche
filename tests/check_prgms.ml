
open Printf

let init_list () = [1; 2; 3; 4; 5 ] ;;

let l = init_list () in
	Lists.print_int_list_nl l

let l = init_list ()

let _ = Lists.print_int_list_nl l ;;

(*
let last_elt = T001_last.last l in
	printf "Last elt = %d\n" last_elt ;;
*)

let l = Lists.mk_int_list 10
  in Lists.print_int_list_nl l
