
type mount_st =
  { dev_st          : string;
    mount_point_st  : string;
    fs_type_st      : string;
    options_st      : string  }

val set_mount_attr  : in_channel -> Str.regexp -> mount_st
val store_params    : string list -> mount_st
