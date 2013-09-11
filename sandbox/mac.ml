
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

(*
let iface  = "eth0"
let iface  = "eth1"
*)

let iface  = Sys.argv.(1)
let ip_cmd = "/sbin/ifconfig" ^ " " ^ iface

let regex  = "^.*[ \t]+HWaddr \\([0-9a-fA-F:]+\\)"

let get_mac_addr () =
  let regcomp = Str.regexp regex in
    Params.with_cmd ip_cmd Params.get_RE_param_chan regcomp ;;

let mac_addr = get_mac_addr () in
    printf "%s\n" mac_addr
