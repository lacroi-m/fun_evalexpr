##
## Makefile for  in /mnt/c/Users/ze/Desktop/gitshit/fun_evalexpr
## 
## Made by DESKTOP-FQFT07H
## Login   <maxime.lacroix@epitech.eu>
## 
## Started on  Tue Dec 12 22:49:20 2017 DESKTOP-FQFT07H
## Last update Wed Dec 13 00:04:12 2017 DESKTOP-FQFT07H
##


OC   = ocamlc

SRC  = main.ml

NAME = funEvalExpr

OBJ  = *.cmo *.cmi

all: $(NAME)

$(NAME):
	$(OC) $(SRC) -o $(NAME)

clean:
	rm $(OBJ)

fclean:
	rm $(OBJ) $(NAME)

re:
	fclean all
