
open Printf

let file_kernel_version = "/proc/version"

let version = Params.field 2 file_kernel_version

let _ = printf "%s\n" version 

