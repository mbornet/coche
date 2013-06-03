
open Printf ;;
open Str ;;
open Sys ;;

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
     | head::tail ->head ;;

let ref_found = ref false ;;

let process_line l ref_found =
     try let _ = Str.search_forward pattern l 0 in
          begin
               (*print_endline l ; *)
               ref_found   := true ;
               printf "found = %s\n" (if !ref_found then "true" else "false");
               let parts    = Str.split (regexp ":") l in
               let values   = left_shift parts in
               let value    = get_first values in
               let qty      = Str.split (regexp "[ \t]+") value in
               let mem_size = get_first qty in
               (* printf "RAM size = [%s]\n" mem_size ; *)
               mem_size;
               (* exit 0 ; *)
          end
     with Not_found -> "" ;;

let process_chan c =
     let ref_found = ref false in
     try while !ref_found = false
          do
               let v = process_line (input_line c) ref_found in v;
               printf "V = %s\n" v;
               printf "FOUND = %s\n" (if !ref_found then "true" else "false");
          done
     with End_of_file -> () ;;

let process_file f =
     let c = open_in f in process_chan c; close_in c;;

let get_param_value name file =
     process_file file ;;

let () =
     if Array.length Sys.argv  = 3 then
          process_file Sys.argv.(2)
     else
          print_endline "(2) Usage : get_param_value name file" ;
          exit 1 ;;
