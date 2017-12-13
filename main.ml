open Printf;;

let main argc argv =
  Printf.printf ("Command line has %i arguments\n") (argc - 1);
  for i = 1 to argc - 1 do
  Printf.printf "argument %i is %s\n" i argv.(i)
  done;;

main (Array.length Sys.argv) Sys.argv;;
