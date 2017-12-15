##
## Makefile for  in /mnt/c/Users/ze/Desktop/gitshit/fun_evalexpr
## 
## Made by DESKTOP-FQFT07H
## Login   <maxime.lacroix@epitech.eu>
## 
## Started on  Tue Dec 12 22:49:20 2017 DESKTOP-FQFT07H
## Last update Fri Dec 15 17:50:05 2017 ze
##


OC   = ocamlc 

SRC	= str.cma\
	  FUN.ml \
	  main.ml

NAME = funEvalExpr

OBJ  = *.cmo *.cmi

all: $(NAME)

$(NAME):
	$(OC) $(SRC) -o $(NAME)

#deps:
#	opam pin add ocamlorg . --no-action --yes --kind=path
#	opam install ocamlorg --deps-only

clean:
	rm $(OBJ)

fclean:
	rm $(OBJ) $(NAME)

re:	fclean	all
