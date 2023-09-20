package ejemploflex;
import java_cup.runtime.*;
import java.util.*;

%%


%cup
%public
%class Lexico
%line
%column
%char







%%

<YYINITIAL> {


{OP_ASIGN}		{System.out.println("Token OP_ASIGN encontrado, Lexema: "+ yytext());}

{OP_SUMA}		{System.out.println("Token OP_SUMA encontrado, Lexema "+ yytext());}

{OP_RESTA}		{System.out.println("Token OP_RESTA encontrado, Lexema "+ yytext());}

{OP_DIV}		{System.out.println("Token OP_DIV encontrado, Lexema "+ yytext());}

{OP_MULT}		{System.out.println("Token OP_MULT encontrado, Lexema "+ yytext());}

{OP_MOD}		{System.out.println("Token OP_MOD encontrado, Lexema "+ yytext());}

{OP_POT}		{System.out.println("Token OP_POT encontrado, Lexema "+ yytext());}

{OP_MEN}		{System.out.println("Token OP_MEN encontrado, Lexema "+ yytext());}

{OP_MAY}		{System.out.println("Token OP_MAY encontrado, Lexema "+ yytext());}

{OP_MAY_IG}		{System.out.println("Token OP_MAY_IG encontrado, Lexema "+ yytext());}

{OP_MEN_IG}		{System.out.println("Token OP_MEN_IG encontrado, Lexema "+ yytext());}

{OP_DIST}		{System.out.println("Token OP_DIST, Lexema "+ yytext());} 

{OP_IG}		    {System.out.println("Token OP_IG, encontrado Lexema "+ yytext());} 

{OP_AND}		{System.out.println("Token OP_AND, encontrado Lexema "+ yytext());} 

{OP_OR}		    {System.out.println("Token OP_OR, encontrado Lexema "+ yytext()); }

{OP_NOT}		{System.out.println("Token OP_NOT, encontrado Lexema "+ yytext());} /* recordar que no debe exceder los 16 bits 0 < entero < 32768 */

{PAREN_OPEN}    {System.out.println("Token PAREN_OPEN, encontrado Lexema "+ yytext()); }

{PAREN_CLOSE}   {System.out.println("Token PAREN_CLOSE, encontrado Lexema "+ yytext()); }

{BLOCK_BEG}		{System.out.println("Token BLOCK_BEG, encontrado Lexema "+ yytext()); }

{BLOCK_END}		{System.out.println("Token BLOCK_END, encontrado Lexema "+ yytext()); }

{BRACK_OPEN}    {System.out.println("Token BRACK_OPEN, encontrado Lexema "+ yytext()); }

{BRACK_CLOSE}	{System.out.println("Token BRACK_CLOSE, encontrado Lexema "+ yytext()); }

{ESPACIO}		{/* no se realiza accion por lo tanto se ignoran*/}

{COMENTARIO}	{/* No se realiza accion por lo tanto se ignoran*/}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }






















