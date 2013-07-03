
open Printf

let uid file =
  if Sys.file_exists file then
    let uid = Unix.stat file in
      uid.Unix.st_uid
    else
      raise Not_found

let _ = let nb_files = Array.length Sys.argv - 1 in
  if nb_files > 0 then
    let file = Sys.argv.(1) in
    try
      printf "%d\n" (uid file)
    with Not_found -> eprintf "\"%s\" : no such file or directory\n" file
  else
    eprintf "Usage: %s pathname\n" Sys.argv.(0)
