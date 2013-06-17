
open Unix ;;
open Printf ;;

let uid = Unix.stat Sys.argv.(1) in
     printf "UID = %d\n" uid.st_uid ;;

