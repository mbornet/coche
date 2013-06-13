
open Printf ;;

let param_virt_procs     = "processor"

let file_cpuinfo         = "/proc/cpuinfo" ;;

let nb_virt_procs        = (Params.count param_virt_procs file_cpuinfo) in
printf "%d\n" nb_virt_procs ;;

exit 0
