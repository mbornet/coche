
open Printf
module U = Unix

let print_status status = match status with
  | U.WSIGNALED signum -> printf "Process killed by signal %d\n" signum
  | U.WEXITED code -> if code <> 0 then printf "Process exited. Return code = %d\n" code
  | _ -> printf "False alarm\n"

let with_proc cmd fct regcomp =
  let chan = Unix.open_process_in cmd in
    try let res = fct chan regcomp in
      Unix.close_process_in chan; res
    with e -> Unix.close_process_in chan; raise e

