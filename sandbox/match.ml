
open Printf

let data = "          inet addr:10.132.1.6  Bcast:10.132.1.255  Mask:255.255.255.0"

let regcomp = Str.regexp "^.*[ \t]+Mask:\\([1-9][0-9.]+\\)"

let s regcomp data  =
  try let _ = Str.search_forward regcomp data 0 in
      Str.matched_group 1 data
  with Not_found -> "#####" ;;

let result = s regcomp data in
  printf "%s\n" result
