##
## Makefile for  in /mnt/c/Users/ze/Desktop/gitshit/fun_evalexpr
## 
## Made by DESKTOP-FQFT07H
## Login   <maxime.lacroix@epitech.eu>
## 
## Started on  Tue Dec 12 22:49:20 2017 DESKTOP-FQFT07H
## Last update Thu Dec 14 18:35:00 2017 berruex renan
##


OC   = ocamlc

SRC	= main.ml

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
