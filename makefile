all:
	$(MAKE) tokens
	$(MAKE) gramatica
	g++ -std=c++11 -Wall -Wextra gramatica.tab.c lex.yy.c main.c -lfl

gramatica:
	bison -d gramatica.y

tokens:
	flex tokens.lex
