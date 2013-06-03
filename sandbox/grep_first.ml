
open Printf ;;
open Str ;;
open Sys ;;

let pattern =
     if Array.length Sys.argv < 2 then
          begin
               print_endline "Usage: grep REGEXP file1 .. file2";
               exit 1
          end
     else
          Str.regexp ("^" ^ Sys.argv.(1) ^ "[ \t:]") ;;

let left_shift l = match l with
     | [] -> l
     | head::tail -> tail ;;

let get_first l = match l with
     | [] -> ""
     | head::tail ->head ;;

let process_line l =
     try let _ = Str.search_forward pattern l 0 in
          begin
               (*print_endline l ; *)
               let parts       = Str.split (regexp ":") l in
               let values      = left_shift parts in
               let value       = get_first values in
               let qty         = Str.split (regexp " +") value in
               let param_val   = get_first qty in
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
