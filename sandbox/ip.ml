
open Printf

type ip_st =
  {
    ip_st         : string;
    broadcast_st  : string;
    netmask_st    : string;
    mac_st        : string;
    state_st      : string }

let ip_cmd = "/sbin/ifconfig eth0"

let with_cmd cmd fct regcomp  =
  let chan = Unix.open_process_in cmd in
    try let res = fct chan regcomp in
      Unix.close_process_in chan; res
    with e -> Unix.close_process_in chan; raise e

let get_ip_addr = let regcomp = Str.regexp ("inet addr:") in
  with_cmd ip_cmd Params.search_param_chan regcomp ;;

let ip_addr = get_ip_addr in
    printf "%s\n" ip_addr
