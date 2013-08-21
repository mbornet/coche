
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
let regex  = "^.*[ \t]+Bcast:\\([1-9][0-9.]+\\)"

let get_bcast_addr () =
  let regcomp = Str.regexp regex in
    Params.with_cmd ip_cmd Params.get_RE_param_chan regcomp ;;

let bcast_addr = get_bcast_addr () in
    printf "%s\n" bcast_addr
