
open Printf

let param_cores_per_cpu  = "cpu cores"
let param_cpu_slots      = "physical id"
let param_virt_procs     = "processor"

let file_cpuinfo         = "/proc/cpuinfo"

let nb_cores_per_cpu     = int_of_string (Params.extract param_cores_per_cpu file_cpuinfo)
let nb_cpu_slots         = Params.count_uniq param_cpu_slots  file_cpuinfo
let nb_virt_procs        = Params.count      param_virt_procs file_cpuinfo

let ht_status =
          if nb_virt_procs = (nb_cores_per_cpu * nb_cpu_slots)     then "off" else
          if nb_virt_procs = (nb_cores_per_cpu * nb_cpu_slots * 2) then "on"  else
          "UNKNOWN"

let _ = printf "%s\n" ht_status

