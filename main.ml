open Printf;;

let symbol_str = "+-*/^v";;

(* return 0 si on trouve [symbol] dans [str] sans qu'il soit dans des parenthèses, sinon return 1 *)

let rec iCanFindThisSymbol str symbol i nbParenth = Printf.printf ("i=%d\n") i;
  match i with
    | i when i == String.length str -> 1    (* si on est a la fin de la chaine *)
    | _ -> if str.[i] == symbol && nbParenth == 0 then 0 else match str.[i] with
                | '(' -> iCanFindThisSymbol str symbol (i + 1) (nbParenth + 1)
                | ')' -> iCanFindThisSymbol str symbol (i + 1) (nbParenth - 1)
                | symbol when nbParenth != 0 -> iCanFindThisSymbol str symbol (i + 1) nbParenth
                | _ -> iCanFindThisSymbol str symbol (i + 1) nbParenth
;;


let rec parcour str symbol_str i =
  match (iCanFindThisSymbol (str) (symbol_str.[i]) (0) (0)) with
    | 1 when i <= 4 -> parcour str symbol_str (i + 1) (*si on trouve pas symbol dans str on passe au suivant*) 
    | others -> 0
;;
(*
    | 0 -> match symbol_str.[i] with
             | '+' -> ADD_FUN (part_before_+) (part_after_+)
             | '-' -> DIF_FUN (part_before_-) (part_after_-)
             | '*' -> PRO_FUN (part_before_x) (part_after_x)
             | '/' -> DIV_FUN (part_before_/) (part_after_/)
             | '^' -> POW_FUN (part_before_^) (part_after_^)
             | 'v' -> SQU_FUN (part_before_v) (part_after_v)
  str;;
*)

let main argc argv =
  Printf.printf ("Command line has %i arguments\n") (argc - 1);
  for i = 1 to argc - 1 do
    Printf.printf "argument %i is %s\n" i argv.(i)
  done;
  Printf.printf ("%d\n") (parcour argv.(1) symbol_str 0);;

main (Array.length Sys.argv) Sys.argv;;
