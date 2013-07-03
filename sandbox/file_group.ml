
open Printf

let group file =
  if Sys.file_exists file then
    let gid_st = Unix.stat file in
      let gr = Unix.getgrgid gid_st.Unix.st_gid in
        gr.Unix.gr_name
  else
    raise Not_found

let _ = let nb_files = Array.length Sys.argv - 1 in
  if nb_files > 0 then
    let file = Sys.argv.(1) in
    try
      printf "%s\n" (group file)
    with Not_found -> eprintf "\"%s\" : no such file or directory\n" file
  else
    eprintf "Usage: %s pathname\n" Sys.argv.(0)
