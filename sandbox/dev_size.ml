(* device size :
 *  df -P | grep $DEVICE | awk '{ print $2 }'
 *)

open Printf

let device = "/dev/sda1"

let df_cmd = "df -P"

(*
let regex  = "^" ^ device ^ "[ \t]+\\([1-9][0-9]*\\)"
*)

let get_dev_size device =
  let regex  = "^" ^ device ^ "[ \t]+\\([1-9][0-9]*\\)" in
    let regcomp = Str.regexp regex in
      Params.with_cmd df_cmd Params.get_RE_param_chan regcomp ;;

let dev_size = get_dev_size device in
  printf "%s\n" dev_size

(*
 let _ = printf "regex = \"%s\"\n" regex

 let get_dev_size device = 
 *)
