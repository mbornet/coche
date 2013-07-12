
open Printf
module U = Unix

type mount_st =
  { dev_st          : string;
    mount_point_st  : string;
    fs_type_st      : string;
    options_st      : string  }

let print_status status = match status with
  | U.WSIGNALED signum -> printf "Process killed by signal %d\n" signum
  | U.WEXITED code -> if code <> 0 then printf "Process exited. Return code = %d\n" code
  | _ -> printf "False alarm\n"

let rec chan_to_list chan =
  try
    let line = input_line chan in
      line :: chan_to_list chan
  with End_of_file -> []

let run_proc_to_list cmd =
  let chan = Unix.open_process_in cmd in
    let res = chan_to_list chan in
      let _ = Unix.close_process_in chan in res

let with_proc cmd fct regcomp =
  let chan = Unix.open_process_in cmd in
    try let res = fct chan regcomp in
      Unix.close_process_in chan; res
    with e -> Unix.close_process_in chan; raise e ;;

let _ = let result = run_proc_to_list "/bin/mount" in
  Lists.print_str_list_nl result

let _ = let result = run_proc_to_list "/bin/mount" in
  Lists.print_num_str_list_nl result 1

let param_name = "/dev/sdc1"

let s =
  let regcomp = Str.regexp ( "^" ^ param_name ^ "[ \t]") in
    with_proc "/bin/mount" Params.search_param_last_field_chan regcomp

let _ = printf "%s\n" s

