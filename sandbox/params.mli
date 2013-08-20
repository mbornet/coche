
val extract_value                : string -> string
val extract_last_value           : string -> string
val search_param_chan            : in_channel -> Str.regexp -> string
val search_param_last_chan       : in_channel -> Str.regexp -> string
val search_param_last_field_chan : in_channel -> Str.regexp -> string

val count_param_chan             : in_channel -> Str.regexp -> int
val store_uniq                   : in_channel -> Str.regexp -> (string, bool) Hashtbl.t ref -> int
val count_uniq_chan              : in_channel -> Str.regexp -> int

val get_field                    : int -> string -> string
val get_field_chan               : in_channel -> int -> string

val with_file                    : string -> (in_channel -> Str.regexp -> string) -> Str.regexp -> string
val mk_re_param                  : string -> Str.regexp

val extract                      : string -> string -> string
val count                        : string -> string -> int
val count_uniq                   : string -> string -> int
val field                        : int -> string -> string
val last_field                   : string -> string -> string

val get_RE_param_chan            : in_channel -> Str.regexp -> string
val get_RE_param                 : Str.regexp -> string -> string
