
open Unix ;;
open Printf ;;

let print_gid file =
     if Sys.file_exists file then
          let gid = Unix.stat file in
               printf "%d\n" gid.st_gid 
     else
          eprintf "\"%s\" : no such file or directory\n" file ;;

let nb_files = Array.length Sys.argv - 1 in
     if nb_files > 0 then
          print_gid Sys.argv.(1)
     else
          eprintf "Usage: %s pathname\n" Sys.argv.(0) ;;
