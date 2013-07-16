
(*
let rec cat chan = 
     try let line = input_line chan in
          let _ = printf "%s\n" line; cat chan
     with End_of_file -> ()
*)

(*
let with_cmd cmd fct =
     let chan = Unix.open_process_in cmd in
     try let res = fct chan in
          Unix.close_process_in chan; res
     with e -> Unix.close_process_in chan; raise e

let _ = with_cmd ip_cmd cat
*)

(*
let cat chan =
  let size = 4 * 1024 in
  let buffer = String.create size in
  let eof = ref false in
    while not !eof do
      let len = input chan buffer 0 size in
        if len > 0
          then print_string (String.sub buffer 0 len)
        else eof := true
    done
*)

