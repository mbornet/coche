
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

let regex  = "^.*[ \t]+Mask:\\([1-9][0-9.]+\\)"

let get_mask_addr () =
  let regcomp = Str.regexp regex in
    Params.with_cmd ip_cmd Params.get_RE_param_chan regcomp ;;

let mask_addr = get_mask_addr () in
    printf "%s\n" mask_addr
