
open Printf

let rec expon x n =
    if n=0 then 1. else x *. expon x (n-1)

let n = 5 ;;

let v = expon 2. n in
	printf "%d ^ %d = %f\n" 2 n v
