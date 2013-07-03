
open Printf

let hostname = Unix.gethostname ()

let _ = printf "%s\n" hostname
