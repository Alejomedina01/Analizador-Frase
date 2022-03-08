%{

#define YYSTYPE char*
#include <stdio.h>

extern int yylex(void);
extern char *yytext;

void yyerror(char *s);
%}

%token PRE ART VER ADJ SUB ADV

%token EOL
/** Sección de reglas **/

%%
line		:
		| line exp EOL
		
exp		: ART SUB VER ADV ADJ
		| SUB VER ART ADJ ADJ
		| SUB VER PRE ADJ ADJ
		| SUB VER ADV ART ADJ
%%
void yyerror (char* s){
 printf("Error: %s\n", s);
}	

int main(){
	printf(">");
	yyparse();
	return 0;
}

int yywrap(){
 return 1;
}


