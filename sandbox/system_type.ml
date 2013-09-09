(* System type :
 *  lsb_release -i | awk '{ print $NF }'
 *)

open Printf

let cmd   = "/usr/bin/lsb_release -i"
let regex = "^Distributor ID:[ \t]\\(.*\\)"

let get_system_type () =
  let regcomp = Str.regexp regex in
    Params.with_cmd cmd Params.get_RE_param_chan regcomp ;;

let system_type = get_system_type () in
  printf "%s\n" system_type
