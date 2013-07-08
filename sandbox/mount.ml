
open Printf
module U = Unix

type mount_st = {
  dev_st          : string;
  mount_point_st  : string;
  fs_type_st      : string;
  options_st      : string
}

let print_status status = match status with
  | U.WSIGNALED signum -> printf "Process killed by signal %d\n" signum
  | U.WEXITED code -> printf "Process exited. Return code = %d\n" code
  | _ -> printf "False alarm\n"

let f cmd =
  let lineno = ref 1 in
    let chan = Unix.open_process_in cmd in
    try
      while true do
        let line = input_line chan in
          printf "%6d %s\n" !lineno line;
          incr lineno
      done
    with
      End_of_file -> let status = Unix.close_process_in chan in
        print_status status

let _ = f "mount"
