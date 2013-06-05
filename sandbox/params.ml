
open Printf ;;

let regcomp = Str.regexp "<VOID>" ;;

(* Extract the first field of the parameter value *)
let extract_value l regcomp =
          let parts       = Str.split (Str.regexp ":") l in
          let values      = Lists.left_shift parts in
          let value       = Lists.get_first values in
          let qty         = Str.split regcomp value in
          let param_value = Lists.get_first qty in
          param_value;;

(* Search the parameter in the file associated to "chan" an return its value *)
let rec search_param chan regcomp =
     try
          let line = input_line chan in
          try let _ = Str.search_forward regcomp line 0 in
               extract_value line regcomp
          with Not_found -> search_param chan regcomp
     with End_of_file -> "" ;;

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
