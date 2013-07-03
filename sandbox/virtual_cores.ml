
open Printf

let param_virt_procs     = "processor"

let file_cpuinfo         = "/proc/cpuinfo"

let nb_virt_procs        = (Params.count param_virt_procs file_cpuinfo)

let _ = printf "%d\n" nb_virt_procs

