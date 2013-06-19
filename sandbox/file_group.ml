
open Unix ;;
open Printf ;;

let print_group file =
     if Sys.file_exists file then
          begin
          let gid_st = Unix.stat file in
          try
               let gr = getgrgid gid_st.st_gid in
                    printf "%s\n" gr.gr_name
          with Not_found -> eprintf "ERROR: GID %d not found !\n" gid_st.st_gid;
          end
     else
          eprintf "\"%s\" : no such file or directory\n" file ;;

let nb_files = Array.length Sys.argv - 1 in
     if nb_files > 0 then
          print_group Sys.argv.(1)
     else
          eprintf "Usage: %s pathname\n" Sys.argv.(0) ;;
