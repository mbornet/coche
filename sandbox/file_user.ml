
open Unix ;;
open Printf ;;

let print_user file =
     if Sys.file_exists file then
          begin
          let uid_st = Unix.stat file in
          try
               let pw = getpwuid uid_st.st_uid in
                    printf "%s\n" pw.pw_name
          with Not_found -> eprintf "ERROR: UID %d not found !\n" uid_st.st_uid;
          end
     else
          eprintf "\"%s\" : no such file or directory\n" file ;;

let nb_files = Array.length Sys.argv - 1 in
     if nb_files > 0 then
          print_user Sys.argv.(1)
     else
          eprintf "Usage: %s pathname\n" Sys.argv.(0) ;;
