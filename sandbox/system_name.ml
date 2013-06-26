
open Printf ;;

let exec_uname =
     Unix.execvp "/bin/uname" [| "uname" ; "-n" |] ;;

exec_uname ;;
