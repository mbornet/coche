
open Printf

let lsb_cmd = "lsb_release -i"

let regex   = "^Distributor ID:[ \t]*\\(.*\\)"

let distrib () = let regcomp = Str.regexp regex in
  Params.with_cmd lsb_cmd Params.get_RE_param_chan regcomp ;;

let dist = distrib () in
  printf "%s\n" dist
