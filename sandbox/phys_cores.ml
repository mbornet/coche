
open Printf

let param_cores_per_cpu  = "cpu cores"
let param_cpu_slots      = "physical id"

let file_cpuinfo         = "/proc/cpuinfo"

let nb_phys_cores = let nb_cores_per_cpu = int_of_string (Params.extract param_cores_per_cpu file_cpuinfo) in
     let nb_cpu_slots = Params.count_uniq param_cpu_slots file_cpuinfo in
          nb_cores_per_cpu * nb_cpu_slots

let _ = printf "%d\n" nb_phys_cores

