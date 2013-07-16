
val print_status     : Unix.process_status -> unit
(*
val chan_to_list     : in_channel -> string list
val run_proc_to_list : string -> string list
*)
val with_proc        : string -> (in_channel -> Str.regexp -> string) -> Str.regexp -> string
