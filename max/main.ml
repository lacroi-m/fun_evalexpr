open Printf;;
(*= ref 0*)

let add = 0;;
let sub = 0;;
let pos = 0;;

let ogline = "";;


let replaceNeg =

done;;

let replacePos =

done;;


let reset =
if sub > 0 then
if sub % 2 then replacePos else replaceNeg
add = 0
sub = 0
done;;

let bool sign = match sign with
| '+' -> true;
| '-' -> true;
| others -> false;
done;;

let checksign char = match char with
| '+' -> add = add + 1;
| '-' ->  sub = sub + 1;
done;;



let checkSet line =
ogline = trim line
for pos to line.length - 1 do
if bool line.[x] then checksign line.[x] else reset
Printf.printf ogline
done;;

(*String.iter (fun z -> checksign z) line;;*)

let main argc argv =
  for i = 1 to argc - 1 do
    while 
  Printf.printf "argument %i is %s\n" i argv.(i)
  done;;

main (Array.length Sys.argv) Sys.argv;;
