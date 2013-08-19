
open Printf

let get_RE_param regcomp line = 

let rec get_RE_param_chan chan regcomp = 
  try let line = input_line chan in
    try let _ = Str.search_forward regcomp line 0 in
      get_RE_param regcomp line
    with Not_found -> get_RE_param_chan chan regcomp
  with End_of_file -> raise Not_found

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
       ignore (Unix.close_process_in chan); res
    with e -> ignore (Unix.close_process_in chan); raise e

let get_mask_addr () = let regcomp = Str.regexp ("^.*[ \t]+Mask:") in
  with_cmd ip_cmd Params.search_param_chan regcomp ;;

let mask_addr = get_mask_addr () in
    printf "%s\n" mask_addr
