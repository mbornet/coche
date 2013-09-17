(*
  Function last : returns the last element of a list.
  'a list -> 'a option
*)

let rec last = function
    | [] -> None
    | [x] -> Some x
    | _ :: t -> last t;;
