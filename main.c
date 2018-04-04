#include "stdio.h"

extern int yyparse();
extern void yyerror(const char *);
extern int yylex();

int main(){
   
   int result = yyparse();
   if(result != 0)
      printf("\npadrão nao aceito\n");
   else
      printf("\npadrao aceito\n");
   return result;
}
