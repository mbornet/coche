
open Unix
open Printf

let mode file =
  if Sys.file_exists file then
    let mode = Unix.stat Sys.argv.(1) in
     mode.st_perm
  else
    raise Not_found

let _ = let nb_files = Array.length Sys.argv - 1 in
  if nb_files > 0 then
    let file = Sys.argv.(1) in
    try
      printf "%04o\n" (mode file)
    with Not_found -> eprintf "\"%s\" : no such file or directory\n" file
  else
    eprintf "Usage: %s pathname\n" Sys.argv.(0)

