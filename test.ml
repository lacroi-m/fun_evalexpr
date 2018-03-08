open Printf;;

let trim str =
if str = "" then "" else
let search_pos init p next =
let rec search i =
if p i then raise(Failure "empty") else
match str.[i] with
| ' ' | '\n' | '\r' | '\t' -> search (next i)
      | _ -> i
    in
    search init
  in
  let len = String.length str in
  try
    let left = search_pos 0 (fun i -> i >= len) (succ)
    and right = search_pos (len - 1) (fun i -> i < 0) (pred)
    in
    String.sub str left (right - left + 1)
Printf.printf "trimed argument is %s\n" str
;;

let main argc argv =
Printf.printf "argument %i is %s\n" 1 argv.(1)
trim str.(1)
;;

main (Array.length Sys.argv) Sys.argv;;
