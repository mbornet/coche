
open Printf

let cmd    = "dpkg -l"
let regex  = "^ii[ \t]+\\([^ \t]+\\) .*"

let rec get_RE_list_chan chan regcomp =
  try let line = input_line chan in
    line :: get_RE_list_chan chan regcomp
  with End_of_file -> [] ;;

(*
let rec get_RE_list_chan chan regcomp =
  try let line = input_line chan in
    try let _ = Str.search_forward regcomp line 0 in
      l :: Params.get_RE_param regcomp line
    with Not_found -> get_RE_list_chan chan regcomp
  with End_of_file -> [] ;;
*)

let get_pkg_list () =
  let regcomp = Str.regexp regex in
    Params.with_cmd cmd get_RE_list_chan regcomp ;;

let pkg_list = get_pkg_list () in
    Lists.print_str_list_nl pkg_list
