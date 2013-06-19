
open Unix ;;
open Printf ;;

let print_mode file =
     if Sys.file_exists file then
          let mode = Unix.stat Sys.argv.(1) in
               printf "%04o\n" mode.st_perm
     else
          eprintf "\"%s\" : no such file or directory\n" file ;;

let nb_files = Array.length Sys.argv - 1 in
     if nb_files > 0 then
          print_mode Sys.argv.(1)
     else
          eprintf "Usage: %s pathname\n" Sys.argv.(0) ;;
