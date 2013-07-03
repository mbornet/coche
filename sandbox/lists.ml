
open Printf

let left_shift l = match l with
     | [] -> l
     | head::tail -> tail

let get_first l = match l with
     | [] -> ""
     | head::tail -> head

let get_last l =
     let lg = List.length l in
     List.nth l (lg - 1)

let rec print_list l = match l with
     | [] -> printf "\n"
     | head::tail -> printf "%s " head ; print_list tail
