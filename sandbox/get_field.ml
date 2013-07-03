
open Printf ;;

let get_field field_no line =
     let regcomp = Str.regexp "[ ]" in
     let fields  = Str.split regcomp line in
     let result  = List.nth fields field_no in
          result ;;

let version = get_field 2 "Linux version 2.6.32-5-amd64 (Debian 2.6.32-48squeeze3) (dannf@debian.org) (gcc version 4.3.5 (Debian 4.3.5-4) ) #1 SMP Fri May 10 08:43:19 UTC 2013"

let _ = printf "%s\n" version
