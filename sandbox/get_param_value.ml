
open Printf ;;

let pattern =
     if Array.length Sys.argv != 3 then
          begin
               print_endline "(1) Usage: get_param_value parameter_name file";
               exit 1
          end
     else
          Str.regexp Sys.argv.(1);;

let left_shift l = match l with
     | [] -> l
     | head::tail -> tail ;;

let get_first l = match l with
     | [] -> ""
     | head::tail -> head ;;

let ref_found = ref false ;;

let rec search_param chan =
     try
          let line = input_line chan in
          try let _ = Str.search_forward pattern line 0 in
               line
          with Not_found -> search_param chan
     with End_of_file -> "" ;;

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

let process_line l ref_found =
     try let _ = Str.search_forward pattern l 0 in
          begin
               ref_found   := true ;
               let parts    = Str.split (Str.regexp ":") l in
               let values   = left_shift parts in
               let value    = get_first values in
               let qty      = Str.split (Str.regexp "[ \t]+") value in
               let mem_size = get_first qty in
               mem_size;
          end
     with Not_found -> "" ;;

let () =
     if Array.length Sys.argv  = 3 then
          begin
               let pvalue = with_file Sys.argv.(2) search_param
               in printf "pvalue = %s\n" pvalue
          end
     else
          print_endline "(2) Usage : get_param_value name file" ;
          exit 1 ;;
