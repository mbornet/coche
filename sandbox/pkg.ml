
open Printf

let ip_cmd = "dpkg -l"
let regex  = "^ii[ \t]+\\([^ \t]+\\) .*"

let rec get_RE_list_chan chan regcomp =
  try let line = input_line chan in
    try let _ = Str.search_forward regcomp line 0 in
      Params.get_RE_param regcomp line
    with Not_found -> get_RE_list_chan chan regcomp
  with End_of_file -> raise Not_found

let get_pkg_name () =
  let regcomp = Str.regexp regex in
    Params.with_cmd ip_cmd get_RE_list_chan regcomp ;;

let pkg_name = get_pkg_name () in
    printf "%s\n" pkg_name
