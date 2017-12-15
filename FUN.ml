let add_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) + int_of_string (part_after));;

let dif_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) - int_of_string (part_after));;

let pro_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) * int_of_string (part_after));;

let div_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) / int_of_string (part_after));;

let pow_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) + int_of_string (part_after));;

let squ_fun  part_before  part_after =
	string_of_int (int_of_string (part_before) + int_of_string (part_after));;

(*let main argc argv =
Printf.printf ("Command line has %i arguments\n") (argc - 1);
Printf.printf "%s\n" (add_fun argv.(1) argv.(2));;

main (Array.length Sys.argv) Sys.argv;;
*)
