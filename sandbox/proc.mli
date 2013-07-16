
val print_status     : Unix.process_status -> unit
val with_proc        : string -> (in_channel -> Str.regexp -> string) -> Str.regexp -> string
