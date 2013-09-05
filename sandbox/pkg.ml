
open Printf

(*
let _ = match Distrib.distrib () with
  | "Debian" -> let cmd = "dpkg -l" and regex = "^ii[ \t]+\\([^ \t]+\\) .*"
  | _ ->        let cmd = "rpm -qa ..." and regex = "RPM NAME"
*)

let cmd    = "dpkg -l"
let regex  = "^ii[ \t]+\\([^ \t]+\\) .*"

(* Store lines matching the regular expression in a list *)
let rec stream_filter chan regcomp =
  try let line = input_line chan in
    try let _ = Str.search_forward regcomp line 0 in
      Str.matched_group 1 line :: stream_filter chan regcomp
    with Not_found -> stream_filter chan regcomp
  with End_of_file -> [] ;;

(*
let rec get_RE_list_chan chan regcomp =
  try let line = input_line chan in
    try let _ = Str.search_forward regcomp line 0 in
      l :: Params.get_RE_param regcomp line
    with Not_found -> get_RE_list_chan chan regcomp
  with End_of_file -> [] ;;
*)

(* Get the list of installed packages *)
let get_pkg_list () =
  let regcomp = Str.regexp regex in
    Params.with_cmd cmd stream_filter regcomp ;;

(* Display the list of installed packages *)
let pkg_list = get_pkg_list () in
    Lists.print_str_list_nl pkg_list ;;
