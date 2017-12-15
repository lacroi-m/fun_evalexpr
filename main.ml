open Printf;;

let symbol_str = "+-*/^v";;
let nbParenthDeleted = 0;




(* let part_before_ str symbol *)
(*
str est une partie du calcul, il faut rappeler parcour avec str en parametre, et renvoyer ce que renvoi parcour
*)




(* return l'endroit ou on trouve symbol dans str (depend de parenthAutorized), return -1 si absent *)

let rec iCanFindThisSymbol str nbParenthAutorized symbol i nbParenth =
  match i with
    | i when i == String.length str -> -1    (* si on est a la fin de la chaine *)
    | _ -> if str.[i] == symbol && nbParenth <= nbParenthAutorized then i else match str.[i] with
                | '(' -> iCanFindThisSymbol str nbParenthAutorized symbol (i + 1) (nbParenth + 1)
                | ')' -> iCanFindThisSymbol str nbParenthAutorized symbol (i + 1) (nbParenth - 1)
                | _ -> iCanFindThisSymbol str nbParenthAutorized symbol (i + 1) nbParenth
;;

let rec parcourSymbol str nbParenthAutorized i =
  let posI = (iCanFindThisSymbol str nbParenthAutorized symbol_str.[i] 0 0);
  match posI with
    | -1 when i <= 4 -> parcourSymbol str nbParenthAutorized (i + 1) (*si on trouve pas symbol dans str on passe au suivant*) 
    | -1 when i == 5 -> -3333
;;
(*
    | _ -> match symbol_str.[i] with
             | '+' -> add_fun (part_before_+) (part_after_+)
             | '-' -> dif_fun (part_before_-) (part_after_-)
             | '*' -> pro_fun (part_before_x) (part_after_x)
             | '/' -> div_fun (part_before_/) (part_after_/)
             | '^' -> pow_fun (part_before_^) (part_after_^)
             | 'v' -> squ_fun (part_before_v) (part_after_v)
  str;;
*)

let rec parcourParenth str nbParenthAutorized =
  let res = parcourSymbol str nbParenthAutorized 0;
  match res with
    | -3333 -> parcourParenth str (nbParenthAutorized + 1)    (*si j'ai rien trouve*)
    | _ -> res
;;

let main argc argv =
  Printf.printf ("Command line has %i arguments\n") (argc - 1);
  for i = 1 to argc - 1 do
    Printf.printf "argument %i is %s\n" i argv.(i)
  done;
  Printf.printf ("%d\n") (parcourParenth argv.(1) 0);;

main (Array.length Sys.argv) Sys.argv;;
