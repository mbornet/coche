
open Printf 

let exec_uname =
     Unix.execvp "/bin/uname" [| "uname" ; "-n" |]

let _ = exec_uname
