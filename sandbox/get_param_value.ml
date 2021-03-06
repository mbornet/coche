
open Printf ;;

let pattern =
     if Array.length Sys.argv != 3 then
          begin
               print_endline "(1) Usage: get_param_value parameter_name file";
               exit 1
          end
     else
          Str.regexp ("^" ^ Sys.argv.(1) ^ "[ \t:]") ;;

(* Extract the first field of the parameter value *)
let extract_value l =
          let parts       = Str.split (Str.regexp ":") l in
          let values      = Lists.left_shift parts in
          let value       = Lists.get_first values in
          let qty         = Str.split (Str.regexp "[ \t]+") value in
          let param_value = Lists.get_first qty in
          param_value;;

(* Search for the parameter in the file associated to "chan" an return its value *)
let rec search_param chan =
     try
          let line = input_line chan in
          try let _ = Str.search_forward pattern line 0 in
               extract_value line
          with Not_found -> search_param chan
     with End_of_file -> "" ;;

(* Run "fct" on "file" *)
let with_file file fct =
     if Sys.file_exists file then
          let chan = open_in file in
          try
                let res = fct chan in
                close_in chan; res
          with e -> close_in chan; raise e
     else begin
          eprintf "File \"%s\" not found !\n" file;
          exit 1
     end ;;

let () =
     if Array.length Sys.argv  = 3 then
          begin
               let pvalue = with_file Sys.argv.(2) search_param
               in printf "%s\n" pvalue
          end
     else
          print_endline "(2) Usage : get_param_value name file" ;
          exit 1 ;;
