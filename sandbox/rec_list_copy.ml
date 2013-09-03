(* Test de copie recursive de liste *)

open Printf

let rec print_str_list l = match l with
     | [] -> printf "\n"
     | head::tail -> printf "%s " head ; print_str_list tail

let print_list = print_str_list



let rec list_cp l = match l with
  | [] -> l
  | hd::tl -> hd:: list_cp tl

let l1 = "a" :: "b" :: "c" ::[] ;;

(* let _ = Lists.print_list l1 *)
let _ = print_list l1

let l2 = list_cp l1

let _ = Lists.print_list l2
