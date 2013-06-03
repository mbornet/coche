
open Printf ;;
open Get_param_value ;;

let param_name      = "MemTotal" ;;
let file            = "/proc/meminfo" ;;

let mem_size = get_param_value param_name file ;;

printf "%s\n" mem_size ;
exit 0 ;;
