
open Printf ;;

let regcomp = Str.regexp "<VOID>" ;;

(* Extract the first field of the parameter value *)
let extract_value l =
          let parts       = Str.split (Str.regexp ":") l in
          let values      = Lists.left_shift parts in
          let value       = Lists.get_first values in
          let qty         = Str.split (Str.regexp "[ \t]+") value in
          let param_value = Lists.get_first qty in
          param_value;;

(* Search for the parameter in the file associated to "chan" an return its value *)
let rec search_param chan regcomp =
     try
          let line = input_line chan in
          try let _ = Str.search_forward regcomp line 0 in
               extract_value line
          with Not_found -> search_param chan regcomp
     with End_of_file -> "" ;;

let rec count_param chan regcomp =
     try
          let line = input_line chan in
          try let _ = Str.search_forward regcomp line 0 in
               1 + count_param chan regcomp
          with Not_found -> count_param chan regcomp
     with End_of_file -> 0 ;;

(* Run "fct" on "file" *)
let with_file file fct regcomp =
     if Sys.file_exists file then
          let chan = open_in file in
          try
                let res = fct chan regcomp in
                close_in chan; res
          with e -> close_in chan; raise e
     else begin
          eprintf "File \"%s\" not found !\n" file;
          exit 1
     end ;;

let extract param_name file =
     let regcomp = Str.regexp ("^" ^ param_name ^ "[ \t:]") in
          with_file file search_param regcomp ;;

let count param_name file =
     let regcomp = Str.regexp ("^" ^ param_name ^ "[ \t:]") in
          with_file file count_param regcomp ;;
