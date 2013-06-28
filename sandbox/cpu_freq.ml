
open Printf ;;

let param_cpu_freq      = "cpu MHz" ;;
let file_cpu_freq       = "/proc/cpuinfo" ;;

let cpu_freq = Params.extract param_cpu_freq file_cpu_freq in
     printf "%s\n" cpu_freq ;

