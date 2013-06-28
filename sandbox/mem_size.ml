
open Printf ;;

let param_mem_size      = "MemTotal" ;;
let file_mem_size       = "/proc/meminfo" ;;

let mem_size = Params.extract param_mem_size file_mem_size in
     printf "%s\n" mem_size ;

