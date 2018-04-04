%{

#include "gramatica.tab.h"

%}

%option yylineno

DIGIT [0-9]
ID [a-z][a-z0-9]*
newline \n
whitespace [\f\v\t\r]
string \"([a-z0-9]*)\"

%%

var                                 {			return TK_VAR;}
begin 			                        {		return TK_BEGIN;}
end			                            {			return TK_END;}
int			                            {			return TK_INT;}
float			                          {		return TK_FLOAT;}
string		                          {	return TK_STRING;}
do			                            {			return TK_DO;}
to			                            {			return TK_TO;}
if			                            {			return TK_IF;}
else			                          {		return TK_ELSE;}
read			                          {		return TK_READ;}
write			                          {		return TK_WRITE;}
or			                            {			return TK_OR;}
and			                            {			return TK_AND;}
not			                            {			return TK_NOT;}
";"			                            {	return TK_PONTOVIRG;}
":"			                            {		return TK_DOIS_PT;}
","			                            {		return TK_VIRG;}
":="			                          {		return TK_ATRIBUICAO;}
"+"			                            {		return TK_ADIC;}
"-"			                            {		return TK_SUBT;}
"*"			                            {	return TK_MULT;}
"/"			                            {		return TK_DIV;}
"=="			                          {		return TK_IGUAL;}
"!="			                          {		return TK_DIFER;}
">"			                            {		return TK_MAIOR;}
"<"			                            {		return TK_MENOR;}
">="			                          {	return TK_MAIOR_IGUAL;}
"<="			                          {	return TK_MENOR_IGUAL;}
"("			                            {	return TK_PAREN_ABERTO;}
")"			                            {	return TK_PAREN_FECHADO;}
{newline}		                        {}
{whitespace}		                    { ++yylineno;}
{DIGIT}+  		                      {	return TK_ICONST;}
{DIGIT}+"."{DIGIT}* 	              {		return TK_FCONST;}
{string}		                        {	return TK_SCONST;}
{ID} 			                          {			return TK_ID;}

%%
