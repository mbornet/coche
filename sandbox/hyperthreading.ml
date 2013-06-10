
open Printf ;;

let param_cores_per_cpu  = "cpu cores" ;;
let param_cpu_slots      = "physical id" ;;
let param_virt_procs     = "processor" ;;

let file_cpuinfo         = "/proc/cpuinfo" ;;

let nb_cores_per_cpu     = int_of_string (Params.extract param_cores_per_cpu file_cpuinfo) ;;
let nb_cpu_slots         = Params.count param_cpu_slots  file_cpuinfo ;;
let nb_virt_procs        = Params.count param_virt_procs file_cpuinfo ;;

printf "Nb cores per CPU      = %d\n" nb_cores_per_cpu ;;
printf "Nb CPU slots          = %d\n" nb_cpu_slots ;;
printf "Nb virtual processors = %d\n" nb_virt_procs ;;

exit 0 ;;
