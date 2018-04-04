%{

#include "gramatica.tab.h"
#include "tree.h"
#include "stdio.h"
#include "stdlib.h"

int yylex (void);
void yyerror (char const *);

%}

%union {
	struct PROGRAMA			*ptr_programa;
	struct LISTADECL		*ptr_listadecl;
	struct LISTACMD			*ptr_listacmd;
	struct VAR 					*ptr_variavel;

	int						numeroInteiro;
	float					numeroFlutuante;
	char*					id;
}

%token <char*>TK_VAR
%token <char*>TK_BEGIN
%token <char*>TK_END
%token <char*>TK_INT
%token <char*>TK_FLOAT
%token <char*>TK_BOOL
%token <char*>TK_STRING
%token <char*>TK_DO
%token <char*>TK_TO
%token <char*>TK_ELSE
%token <char*>TK_IF
%token <char*>TK_READ
%token <char*>TK_WHILE
%token <char*>TK_WRITE
%token <char*>TK_OR
%token <char*>TK_AND
%token <char*>TK_NOT
%token <char*>TK_IGUAL
%token <char*>TK_DIFER
%token <char*>TK_MAIOR_IGUAL
%token <char*>TK_MENOR_IGUAL

%token <id>TK_ID
%token <numeroInteiro>TK_ICONST
%token <numeroInteiro>TK_INDICE_ARRAY
%token <char*>TK_SCONST
%token <numeroFlutuante>TK_FCONST


%token <char>TK_PONTOVIRG
%token <char>TK_DOIS_PT
%token <char>TK_ATRIBUICAO
%token <char>TK_VIRG
%token <char>TK_ADIC
%token <char>TK_SUBT
%token <char>TK_MULT
%token <char>TK_DIV
%token <char>TK_MAIOR
%token <char>TK_MENOR
%token <char>TK_PAREN_ABERTO
%token <char>TK_PAREN_FECHADO

%type <ptr_program> programa
%type <ptr_variavel> var

%start programa
%locations

%%

programa:
	 TK_VAR listadecl TK_BEGIN listacmd TK_END {}

listadecl:
	listadecl TK_PONTOVIRG vardecl {}
	| vardecl {}

vardecl:
	tipo TK_DOIS_PT listavar {}
	| %empty
tipo:
	TK_INT {}
	| TK_BOOL {}
	| TK_STRING {}

listavar:
	listavar TK_VIRG var {}
	| var {}
var:
	TK_ID {createVar($1);}

listacmd:
	listacmd TK_PONTOVIRG cmd {}
	| cmd {}
cmd:
	atribuicao TK_VIRG{}
	|TK_DO atribuicao TK_TO val TK_BEGIN listacmd TK_END {}
	| TK_IF expr listacmd TK_END {}
	| TK_ID expr listacmd TK_ELSE listacmd TK_END {}
	| TK_WHILE expr listacmd TK_END {}
	| TK_READ TK_ID TK_VIRG {}
	| TK_WRITE TK_ID expr TK_VIRG {}
	| atribuicao TK_VIRG {}
	| %empty
atribuicao:
	TK_ID TK_ATRIBUICAO val { }
	| lval TK_ATRIBUICAO expr {}
	| %empty
val:
	lval {}
	|const {}
	| %empty
lval:
	TK_ID {}
	| %empty
expr:
	expr TK_ADIC expr
	| expr TK_SUBT expr
	| expr TK_MULT expr
	| expr TK_DIV expr
	| TK_SUBT expr
	| expr TK_OR expr
	| expr TK_AND expr
	| TK_NOT expr
	| expr TK_IGUAL expr
	| expr TK_DIFER expr
	| expr TK_MAIOR expr
	| expr TK_MENOR expr
	| expr TK_MAIOR_IGUAL expr
	| expr TK_MENOR_IGUAL expr
	| TK_PAREN_ABERTO expr TK_PAREN_FECHADO
	| const
	| TK_ID
	| %empty
const:
	TK_ICONST
	| TK_FCONST
	| TK_SCONST

%%

void yyerror(char const *str)
{
   extern int yylineno;
   fprintf(stderr,"Error | Line: %d\n%s\n",yylineno,str);
}
