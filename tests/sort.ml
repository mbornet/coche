
let rec sort lst =
   match lst with
     [] -> []
   | head :: tail -> insert head (sort tail)
 and insert elt lst =
   match lst with
     [] -> [elt]
   | head :: tail -> if elt <= head then elt :: lst else head :: insert elt tail
 ;;

let l = [ "C" ; "D"; "F"; "A"; "E"; "B" ]

let l_sorted = sort l

let _ = Lists.print_str_list l_sorted
