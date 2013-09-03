
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

(* let iface  = "eth0" *)
let iface  = "eth1"
let ip_cmd = "/sbin/ifconfig" ^ " " ^ iface

let regex  = "^[ \t]+inet addr:\\([1-9][0-9.]+\\)"

let get_ip_addr () = let regcomp = Str.regexp regex in
  Params.with_cmd ip_cmd Params.get_RE_param_chan regcomp ;;

let ip_addr = get_ip_addr () in
    printf "%s\n" ip_addr
