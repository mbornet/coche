
open Unix ;;
open Printf ;;

let mode = Unix.stat Sys.argv.(1) in
     printf "MODE = %o\n" mode.st_perm ;;

