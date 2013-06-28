
open Printf ;;

let param_swap_size     = "SwapTotal" ;;
let file_swap_size      = "/proc/meminfo" ;;

let swap_size = Params.extract param_swap_size file_swap_size in
     printf "%s\n" swap_size ;

