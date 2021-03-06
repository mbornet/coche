
open Printf

let regcomp = Str.regexp "<VOID>"

(* Extract the first field of the parameter value *)
let extract_value line =
     let parts       = Str.split (Str.regexp ":") line in
     let values      = Lists.left_shift parts in
     let value       = Lists.get_first values in
     let qty         = Str.split (Str.regexp "[ \t]+") value in
     let param_value = Lists.get_first qty in
     param_value

let extract_last_value line =
begin
     let parts       = Str.split (Str.regexp ":") line in
     let values      = Lists.left_shift parts in
     let value       = Lists.get_first values in
     let qty         = Str.split (Str.regexp "[ \t]+") value in
     let param_value = Lists.get_last qty in
     param_value
end

let extract_last_field line =
     let fields      = Str.split (Str.regexp "[ \t]+") line in
     let param_value = Lists.get_last fields in
     param_value

(* Search for the parameter in the file associated to "chan" an return its value *)
let rec search_param_chan chan regcomp =
     try let line = input_line chan in
          try let _ = Str.search_forward regcomp line 0 in
               extract_value line
          with Not_found -> search_param_chan chan regcomp
     with End_of_file -> ""

let rec search_param_last_chan chan regcomp =
     try let line = input_line chan in
        begin
          try let _ = Str.search_forward regcomp line 0 in
               extract_last_value line
          with Not_found -> search_param_last_chan chan regcomp
        end
     with End_of_file -> raise Not_found ;;

let rec search_param_last_field_chan chan regcomp =
     try let line = input_line chan in
          try let _ = Str.search_forward regcomp line 0 in
               extract_last_field line
          with Not_found -> search_param_last_field_chan chan regcomp
     with End_of_file -> raise Not_found

(* Count the number of occurences of the specified regular experience *)
let rec count_param_chan chan regcomp =
     try let line = input_line chan in
          try let _ = Str.search_forward regcomp line 0 in
               1 + count_param_chan chan regcomp
          with Not_found -> count_param_chan chan regcomp
     with End_of_file -> 0

let rec store_uniq chan regcomp ref_h =
     try let line = input_line chan in
          try let _ = Str.search_forward regcomp line 0 in
               Hashtbl.replace !ref_h line true;
               store_uniq chan regcomp ref_h;
          with Not_found -> store_uniq chan regcomp ref_h ;
     with End_of_file -> Hashtbl.length !ref_h

let count_uniq_chan chan regcomp =
     let h = Hashtbl.create 16 in
          store_uniq chan regcomp (ref h)

let get_field field_no line =
     let regcomp = Str.regexp "[ ]" in
     let fields  = Str.split regcomp line in
     let result  = List.nth fields field_no in
          result

let get_field_chan chan field_no =
     try let line = input_line chan in
          get_field field_no line
     with End_of_file -> ""

(* Run "fct" on "file" *)
let with_file file fct regcomp =
     if Sys.file_exists file then
          let chan = open_in file in
          try let res = fct chan regcomp in
               close_in chan; res
          with e -> close_in chan; raise e
     else
          begin
               eprintf "File \"%s\" not found !\n" file;
               exit 1
          end

let mk_re_param param_name = Str.regexp ("^" ^ param_name ^ "[ \t:]")

let extract param_name file =
     let regcomp = mk_re_param param_name in
          with_file file search_param_chan regcomp

let count param_name file =
     let regcomp = mk_re_param param_name in
          with_file file count_param_chan regcomp

let count_uniq param_name file =
     let regcomp = mk_re_param param_name in
          with_file file count_uniq_chan regcomp

let field field_no file =
     with_file file get_field_chan field_no

let last_field param_name file =
     let regcomp = mk_re_param param_name in
          with_file file search_param_last_chan regcomp

let get_RE_param regcomp line =
  try let _ = Str.search_forward regcomp line 0 in
    Str.matched_group 1 line
  with Not_found -> raise Not_found

let rec get_RE_param_chan chan regcomp =
  try let line = input_line chan in
    try let _ = Str.search_forward regcomp line 0 in
      get_RE_param regcomp line
    with Not_found -> get_RE_param_chan chan regcomp
  with End_of_file -> raise Not_found

(*
let rec get_RE_list_chan chan regcomp =
  try let line = input_line chan in
    try let _ = Str.search_forward regcomp line 0 in
      get_RE_param regcomp line
    with Not_found -> get_RE_param_chan chan regcomp
  with End_of_file -> raise Not_found
*)

let with_cmd cmd fct regcomp  =
  let chan = Unix.open_process_in cmd in
    try let res = fct chan regcomp in
       ignore (Unix.close_process_in chan); res
    with e -> ignore (Unix.close_process_in chan); raise e

