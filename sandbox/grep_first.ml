
open Printf ;;

let pattern =
     if Array.length Sys.argv < 2 then
          begin
               print_endline "Usage: grep REGEXP file1 .. file2";
               exit 1
          end
     else
          Str.regexp ("^" ^ Sys.argv.(1) ^ "[ \t:]") ;;

let process_line l =
     try let _ = Str.search_forward pattern l 0 in
          begin
               let parts       = Str.split (Str.regexp ":") l in
               let values      = Lists.left_shift parts in
               let value       = Lists.get_first values in
               let qty         = Str.split (Str.regexp " +") value in
               let param_val   = Lists.get_first qty in
               print_endline param_val ;
               exit 0 ;
          end
     with Not_found -> () ;;

let process_chan c =
     try while true
          do
               process_line (input_line c)
          done
     with End_of_file -> () ;;

let process_file f =
     let c = open_in f in process_chan c; close_in c;;

let () =
     if Array.length Sys.argv > 2 then
          for i = 2 to Array.length Sys.argv - 1
          do
               process_file Sys.argv.(i)
          done
     else
          process_chan stdin ;;
