
open Printf

let rec power n x =
    if n=0 then 1. else x *. power (n-1) x

let n = 5 ;;

let v = power n 2. in
	printf "%d ^ %d = %f\n" 2 n v
