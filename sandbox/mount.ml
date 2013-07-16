
open Printf

type mount_st =
  { dev_st          : string;
    mount_point_st  : string;
    fs_type_st      : string;
    options_st      : string  }

let mount_cmd        = "/bin/mount"

(* field numbers of the attributes of a device mount in the output of "mount" *)
let mount_dev_idx         = 1 - 1
let mount_mount_point_idx = 3 - 1
let mount_fs_type_idx     = 5 - 1
let mount_options_idx     = 6 - 1

let store_params params_list =
  let params_array = Array.of_list params_list in
    let m = {
      dev_st         = params_array.(mount_dev_idx);
      mount_point_st = params_array.(mount_mount_point_idx);
      fs_type_st     = params_array.(mount_fs_type_idx);
      options_st     = params_array.(mount_options_idx)
    }
    in m

let rec set_mount_attr chan regcomp =
  try let line = input_line chan in
    try let _ = Str.search_forward regcomp line 0 in
      let fields = Str.split (Str.regexp "[ \t]+") line in
        store_params fields
    with Not_found -> set_mount_attr chan regcomp
  with End_of_file -> raise Not_found

let get_mount_infos device_name =
  let regcomp = Str.regexp ( "^" ^ device_name ^ "[ \t]") in
    Proc.with_proc mount_cmd set_mount_attr regcomp

let print_mount_infos device = let m = get_mount_infos device in
    printf "%s %s %s %s\n" m.dev_st m.mount_point_st m.fs_type_st m.options_st

let _ = let nb_args = Array.length Sys.argv - 1 in
  if nb_args > 0 then
    let device = Sys.argv.(1) in
      print_mount_infos device
  else
    eprintf "Usage: %s device_name\n" Sys.argv.(0)
