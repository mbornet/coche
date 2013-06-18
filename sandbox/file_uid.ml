
open Unix ;;
open Printf ;;

let print_uid file =
     if Sys.file_exists file then
          let uid = Unix.stat file in
               printf "%d\n" uid.st_uid 
     else
          eprintf "\"%s\" : no such file or directory\n" file ;;

let nb_files = Array.length Sys.argv - 1 in
     if nb_files > 0 then
          print_uid Sys.argv.(1)
     else
          eprintf "Usage: %s pathname\n" Sys.argv.(0) ;;
