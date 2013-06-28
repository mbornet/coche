
open Printf ;;

let param_cpu_max_freq = "model name" ;;
let file_cpu_max_freq  = "/proc/cpuinfo" ;;

let cpu_max_freq = Params.last_field param_cpu_max_freq file_cpu_max_freq in
     printf "%s\n" cpu_max_freq;

