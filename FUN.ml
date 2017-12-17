let add_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) + int_of_string (part_after));;

let dif_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) - int_of_string (part_after));;

let pro_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) * int_of_string (part_after));;

let div_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) / int_of_string (part_after));;

let rec poww num power =
if power == 0 then 1
else num * (poww num (power - 1));;

let pow_fun f n =
string_of_int (poww (int_of_string f) (int_of_string n));;


let rec fact x step =
if step * step == x then step
else if ((step + 1) * (step + 1)) > x && (step * step) < x then step
else fact x (step + 1);;

let squ_fun number =
string_of_int (fact (int_of_string number) 0);;


let nowhite str =
Str.global_replace (Str.regexp "[ \t]") "" str;;

let doubleop str = Str.string_match (Str.regexp "++|+-|-+|--") str 0;;

let replaceplus str = Str.replace_first (Str.regexp "\\+\\+|--") "+" str;;
let replaceminu str = Str.replace_first (Str.regexp "\\+-|-\\+") "-" str;;


let replace str = Printf.printf "%s\n" (replaceplus (replaceminu str));
replaceplus (replaceminu str);; 

let rec nodoubleop str =
match (doubleop str) with
| true -> nodoubleop (replace str)
| false -> str
;;
(*
let main argc argv =
Printf.printf ("Command line has %i arguments\n") (argc - 1);
Printf.printf "%s\n%s\n" argv.(1) (nodoubleop argv.(1));;

(*Printf.printf "%s\n" (add_fun (nowhite argv.(1)) (nowhite argv.(2)));
Printf.printf "%s\n" (pow_fun (nowhite argv.(1)) (nowhite argv.(2)));
Printf.printf "%s\n" (squ_fun (nowhite argv.(1)));
;; *)

main (Array.length Sys.argv) Sys.argv;;
*)
