
open Printf

let rec print_str_list l = match l with
     | [] -> printf "\n"
     | head::tail -> printf "%s " head ; print_str_list tail

let rec print_str_list_nl l = match l with
     | [] -> printf "\n"
     | head::tail -> printf "%s\n" head ; print_str_list_nl tail

let rec print_num_str_list_nl l n = match l with
     | [] -> printf "\n"
     | head::tail -> printf "%5d %s\n" n head ; print_num_str_list_nl tail (n + 1) ;;

let rec print_int_list l = match l with
     | [] -> printf "\n"
     | head::tail -> printf "%d " head ; print_int_list tail

let print_list = print_str_list
let left_shift l = match l with
     | [] -> l
     | head::tail -> tail

let get_first l = match l with
     | [] -> ""
     | head::tail -> head

let get_last l =
     let lg = List.length l in
      List.nth l (lg - 1)

(*
let rec chan_to_list chan =
  try
    let line = input_line chan in
      line :: chan_to_list chan
  with End_of_file -> []

let run_proc_to_list cmd =
  let chan = Unix.open_process_in cmd in
    let res = chan_to_list chan in
      let _ = Unix.close_process_in chan in res
*)

