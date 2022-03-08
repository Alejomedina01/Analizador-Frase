%{
#include "Frase.tab.h"
#include<stdio.h>
%}
/*Sección de reglas*/

article ("un"|"unos"|"una"|"unas"|"el"|"los"|"la"|"las"|"lo"|ello"|Un"|"Unos"|"Una"|"Unas"|"El"|"Los"|"La"|"Las"|"Lo"|Ello)

subject [a-zA-Z]*

adverb ("muy"|"mucho"|"muchas"|"muchos"|"mucha"|"si"|"no"|"quiza"|"tambien")

adjective [a-z]*

verbToBe ("soy"|"eres"|"es"|"somos"|"son"|"estar"|"estoy"|"estas"|"esta"|"estamos"|"estan"|"va"|"van"|"gusta")

verb [a-z]+("ar"|"er"|"ir"|"ando"|"iendo"|"ado"|"ido"|"so"|"amos"|"emos"|"imons"|"aron"|"ieron"|"aban"|"aba"|"ia"|"ran"|"re"|"es")

preposition ("a"|"ante"|"bajo"|"cabe"|"con"|"contra"|"de"|"desde"|"durante"|"en"|"entre"|"hacia"|"hasta"|"mediante"|"para"|"por"|"segun"|"sin"|"so"|"sobre"|"tras"|"versus"|"via")
%%
{preposition}					{printf("Preposicion: %s\n",yytext);return PRE;}
{article} 					{printf("Articulo: %s\n",yytext);return ART;}
{verb}|{verbToBe}				{printf("Verbo: %s\n",yytext);return VER;}
[ \t]						{ }
{adverb}					{printf("Adverbio: %s\n",yytext);return ADV;}
{adjective}					{printf("adjetivo: %s\n",yytext);return ADJ;}
{subject} 					{printf("Sujeto: %s\n",yytext);return SUB;}
\n						{ return EOL; }
.						{printf("Error Léxico: %s\n",yytext);}
%%
