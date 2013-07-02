
open Unix
open Printf

let group file =
  if Sys.file_exists file then
    let gid_st = Unix.stat file in
        let gr = getgrgid gid_st.st_gid in
          gr.gr_name
  else
    raise Not_found

let _ = let nb_files = Array.length Sys.argv - 1 in
  if nb_files > 0 then
    let file = Sys.argv.(1) in
    try
      printf "%s\n" (group file)
    with Not_found -> eprintf "ERROR: \"%s\" not found !\n" file
  else
    eprintf "Usage: %s pathname\n" Sys.argv.(0)
