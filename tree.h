#include "stdio.h"
#include "stdlib.h"

#ifndef AST_H
#define AST_H

#define bool char
#define true 1
#define false 0

struct PROGRAMA
{
	struct LISTADECL *listadeclaracao;
	struct LISTACMD *listacomando;
};

struct LISTADECL
{
  struct VARDECL *vardeclaracao;
  struct LISTADECL *listadeclaracao;
};

struct VARDECL
{
  struct TIPO *tipo;
  struct LISTAVAR *listavariaveis;
};

struct TIPO
{
  char *tipovariavel;
};

struct LISTAVAR
{
  struct VAR *variavel;
  struct LISTAVAR *listavariaveis;
};

struct VAR
{
  char *idvariavel;
};

struct LISTACMD
{
  struct COMANDO *comando;
  struct LISTACMD *listacomando;
};

struct comando
{
  struct ATRIBUICAO *atribuicao;
};

struct atribuicao
{
  struct VAR *variavel;
  union
	{
		int numerointeiro; // int
		float numeroflutuante; // float
	} valor;
};


struct VAR createVar(char *idvariavel){
  struct VAR *var = (struct VAR*)malloc( sizeof(struct VAR) );
  var->idvariavel = idvariavel;
  return *var;
};

#endif
