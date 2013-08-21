
open Printf

(*
type ip_st =
  {
    ip_st         : string;
    broadcast_st  : string;
    netmask_st    : string;
    mac_st        : string;
    state_st      : string }
*)

let ip_cmd = "/sbin/ifconfig eth0"
let regex  = "^.*[ \t]+HWaddr \\([0-9a-fA-F:]+\\)"

let with_cmd cmd fct regcomp  =
  let chan = Unix.open_process_in cmd in
    try let res = fct chan regcomp in
       ignore (Unix.close_process_in chan); res
    with e -> ignore (Unix.close_process_in chan); raise e

let get_mac_addr () =
  let regcomp = Str.regexp regex in
    with_cmd ip_cmd Params.get_RE_param_chan regcomp ;;

let mac_addr = get_mac_addr () in
    printf "%s\n" mac_addr
