
let left_shift l = match l with
     | [] -> l
     | head::tail -> tail ;;

let get_first l = match l with
     | [] -> ""
     | head::tail -> head ;;

