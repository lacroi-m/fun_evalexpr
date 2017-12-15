open Printf;;

let symbol_str = "+-*/^v";;

(******* return 1 si y'a un symbol dans str, sinon return 0 *******)
let rec simpleNumber str i =
  match i with
    | i when i == String.length str -> 0
    | _ -> match str.[i] with
           | '+' -> 1
           | '-' -> 1
           | '*' -> 1
           | '/' -> 1
           | '^' -> 1
           | 'v' -> 1
           | _ -> simpleNumber str (i + 1)
;;

(** fonctions qui enleve les parentheses au debut et a la fin de str**)

let rec deleteUselessParenthEnd str i =
   match str.[i] with
     | ')' -> deleteUselessParenthEnd str (i - 1)
     | _ -> String.sub str 0 (i + 1)
;;

let rec deleteUselessParenthBegin str i =
  match str.[i] with
    | '(' -> deleteUselessParenthBegin str (i + 1)
    | _ -> String.sub str i ((String.length str) - i)
;;


let getFirstPart str posI = String.sub str 0 posI
;;

let getSecondPart str posI = String.sub str (posI + 1) ((String.length str) - posI - 1)
;;


(* return l'endroit ou on trouve symbol dans str (depend de parenthAutorized), return -1 si absent *)

let rec iCanFindThisSymbol str nbParenthAutorized symbol i nbParenth =
  match i with
    | i when i == String.length str -> -1    (* si on est a la fin de la chaine *)
    | _ -> if str.[i] == symbol && nbParenth <= nbParenthAutorized then i
           else match str.[i] with
                | '(' -> iCanFindThisSymbol str nbParenthAutorized symbol (i + 1) (nbParenth + 1)
                | ')' -> iCanFindThisSymbol str nbParenthAutorized symbol (i + 1) (nbParenth - 1)
                | _ -> iCanFindThisSymbol str nbParenthAutorized symbol (i + 1) nbParenth
;;


let rec parcourSymbol str nbParenthAutorized i =
  let posI = (iCanFindThisSymbol str nbParenthAutorized symbol_str.[i] 0 0) in
  match posI with
    | -1 when i <= 4 -> parcourSymbol str nbParenthAutorized (i + 1) (*si on trouve pas symbol dans str on passe au suivant*)
    | -1 when i == 5 -> "notFind"
    | _ -> match symbol_str.[i] with
             | '+' -> FUN.add_fun (parcourParenth (getFirstPart str posI) 0) (parcourParenth (getSecondPart str posI) 0)
             | '-' -> FUN.dif_fun (parcourParenth (getFirstPart str posI) 0) (parcourParenth (getSecondPart str posI) 0)
             | '*' -> FUN.pro_fun (parcourParenth (getFirstPart str posI) 0) (parcourParenth (getSecondPart str posI) 0)
             | '/' -> FUN.div_fun (parcourParenth (getFirstPart str posI) 0) (parcourParenth (getSecondPart str posI) 0)
             | '^' -> FUN.pow_fun (parcourParenth (getFirstPart str posI) 0) (parcourParenth (getSecondPart str posI) 0)
             | 'v' -> FUN.squ_fun (parcourParenth (getSecondPart str posI) 0)
             | _ -> str

and
parcourParenth str nbParenthAutorized =
if (simpleNumber str 0) == 0 then (deleteUselessParenthEnd (deleteUselessParenthBegin str 0) (String.length (deleteUselessParenthBegin str 0) - 1)) else
  match nbParenthAutorized with
    | nbParenthAutorized when nbParenthAutorized > 15 -> "0"
    | _ -> let res = parcourSymbol str nbParenthAutorized 0 in
           match res with
           | "notFind" -> parcourParenth str (nbParenthAutorized + 1)
           | _ -> res
;;

let main argc argv =
  Printf.printf ("%s\n") (parcourParenth argv.(1) 0);;

main (Array.length Sys.argv) Sys.argv;;
