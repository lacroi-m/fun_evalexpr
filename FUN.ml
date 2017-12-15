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

(*
let main argc argv =
Printf.printf ("Command line has %i arguments\n") (argc - 1);
Printf.printf "%s\n" (add_fun argv.(1) argv.(2));
Printf.printf "%s\n" (pow_fun argv.(1) argv.(2));
Printf.printf "%s\n" (squ_fun argv.(1));
;;

main (Array.length Sys.argv) Sys.argv;;
*)
