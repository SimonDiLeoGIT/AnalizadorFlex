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

LETRA = [a-zA-Z]
DIGITO = [0-9]
ESPACIO = [ \t\f\n\r\n]+
//ID = {LETRA} ({LETRA}|{DIGITO}|_)*
//CONST_INT = {DIGITO}+

OP_ASIGN = "="
OP_SUMA = "+"
OP_RESTA = "-"
OP_DIV = "/"
OP_MULT = "*"
OP_MOD = "%"
OP_POT = "^"
OP_MEN = "<"
OP_MAY = ">"
OP_MAY_IG = ">="
OP_MEN_IG = "<="
OP_IG = "=="
OP_DIST = "<>"
OP_AND = "&"
OP_OR = "||"
OP_NOT = "!"
PAREN_OPEN = "("
PAREN_CLOSE = ")"
BLOCK_BEG = "{"
BLOCK_END = "}"
BRACK_OPEN = "["
BRACK_CLOSE = "]"
PUNTO_COMA = ";"
COMA = ","
PUNTO = "."
DOS_PUNTOS = ":"
WRITE = "WRITE"
ID = {LETRA} ({LETRA} | {DIGITO} | _ ({LETRA}|{DIGITO}))*
CONST_INT = {DIGITO}+
CONST_DOU = ({DIGITO}* "." {DIGITO}+) | ({DIGITO}+ "." {DIGITO}*)
CONST_STR = "“" ({DIGITO}|{LETRA})* "”" 
CONST_BIN = "(" ("0"|"1")+  "," "2" ")"
CONST_HEX = "("  ({DIGITO} | "A" | "B" | "C" | "D" | "E" | "F")+  "," "16"  ")"
INTEGER = "INTEGER"
STRING = "STRING"
FLOAT = "FLOAT"
COMMENT = "/*" ~ "*/" // El simbolo ~ incluye cualquier caracter
INLINE_COMMENT = "//" ~ 
WHILE = "WHILE"
IF = "IF"
ELSE = "ELSE"
DEFINE = "DEFINE"
DEFINE_END = "ENDDEFINE"
PROGRAM_BEGIN = "PROGRAM"
PROGRAM_END = "END"
MIDDLE = "MIDDLE"


%%

<YYINITIAL> {


{OP_ASIGN}		    {System.out.println("Token OP_ASIGN encontrado, Lexema: "+ yytext());}
{OP_SUMA}		    {System.out.println("Token OP_SUMA encontrado, Lexema "+ yytext());}
{OP_RESTA}		    {System.out.println("Token OP_RESTA encontrado, Lexema "+ yytext());}
{OP_DIV}		    {System.out.println("Token OP_DIV encontrado, Lexema "+ yytext());}
{OP_MULT}		    {System.out.println("Token OP_MULT encontrado, Lexema "+ yytext());}
{OP_MOD}		    {System.out.println("Token OP_MOD encontrado, Lexema "+ yytext());}
{OP_POT}		    {System.out.println("Token OP_POT encontrado, Lexema "+ yytext());}
{OP_MEN}		    {System.out.println("Token OP_MEN encontrado, Lexema "+ yytext());}
{OP_MAY}		    {System.out.println("Token OP_MAY encontrado, Lexema "+ yytext());}
{OP_MAY_IG}		    {System.out.println("Token OP_MAY_IG encontrado, Lexema "+ yytext());}
{OP_MEN_IG}		    {System.out.println("Token OP_MEN_IG encontrado, Lexema "+ yytext());}
{OP_DIST}		    {System.out.println("Token OP_DIST, Lexema "+ yytext());} 
{OP_IG}		        {System.out.println("Token OP_IG, encontrado Lexema "+ yytext());} 
{OP_AND}		    {System.out.println("Token OP_AND, encontrado Lexema "+ yytext());} 
{OP_OR}		        {System.out.println("Token OP_OR, encontrado Lexema "+ yytext()); }
{OP_NOT}		    {System.out.println("Token OP_NOT, encontrado Lexema "+ yytext());} 
{PAREN_OPEN}        {System.out.println("Token PAREN_OPEN, encontrado Lexema "+ yytext()); }
{PAREN_CLOSE}       {System.out.println("Token PAREN_CLOSE, encontrado Lexema "+ yytext()); }
{BLOCK_BEG}		    {System.out.println("Token BLOCK_BEG, encontrado Lexema "+ yytext()); }
{BLOCK_END}		    {System.out.println("Token BLOCK_END, encontrado Lexema "+ yytext()); }
{BRACK_OPEN}        {System.out.println("Token BRACK_OPEN, encontrado Lexema "+ yytext()); }
{BRACK_CLOSE}	    {System.out.println("Token BRACK_CLOSE, encontrado Lexema "+ yytext()); }
{PUNTO_COMA}	    {System.out.println("Token PUNTO_COMA, encontrado Lexema "+ yytext()); }
{COMA}	            {System.out.println("Token COMA, encontrado Lexema "+ yytext()); }
{PUNTO}	            {System.out.println("Token PUNTO, encontrado Lexema "+ yytext()); }
{DOS_PUNTOS}	    {System.out.println("Token DOS_PUNTOS, encontrado Lexema "+ yytext()); }
{WRITE}	            {System.out.println("Token WRITE, encontrado Lexema "+ yytext()); }
{ID}	            {System.out.println("Token WRITE, encontrado Lexema "+ yytext()); }
{CONST_INT}	        {System.out.println("Token CONST_INT, encontrado Lexema "+ yytext()); } /* recordar que no debe exceder los 16 bits 0 < entero < 32768 */
{CONST_DOU}	        {System.out.println("Token CONST_DOU, encontrado Lexema "+ yytext()); } /* recordar que no debe exceder los 32 bits */
{CONST_STR}	        {System.out.println("Token CONST_STR, encontrado Lexema "+ yytext()); }
{CONST_BIN}	        {System.out.println("Token CONST_BIN, encontrado Lexema "+ yytext()); }
{CONST_HEX}	        {System.out.println("Token CONST_HEX, encontrado Lexema "+ yytext()); }
{INTEGER}	        {System.out.println("Token INTEGER, encontrado Lexema "+ yytext()); }
{STRING}	        {System.out.println("Token STRING, encontrado Lexema "+ yytext()); }
{FLOAT}	            {System.out.println("Token FLOAT, encontrado Lexema "+ yytext()); }
{COMMENT}	        {System.out.println("Token COMMENT, encontrado Lexema "+ yytext()); }
{INLINE_COMMENT}    {System.out.println("Token INLINE_COMMENT, encontrado Lexema "+ yytext()); }
{WHILE}	            {System.out.println("Token WHILE, encontrado Lexema "+ yytext()); }
{IF}	            {System.out.println("Token IF, encontrado Lexema "+ yytext()); }
{ELSE}	            {System.out.println("Token ELSE, encontrado Lexema "+ yytext()); }
{DEFINE}	        {System.out.println("Token DEFINE, encontrado Lexema "+ yytext()); }
{DEFINE_END}	    {System.out.println("Token DEFINE_END, encontrado Lexema "+ yytext()); }
{PROGRAM_BEGIN}	    {System.out.println("Token PROGRAM_BEGIN, encontrado Lexema "+ yytext()); }
{PROGRAM_END}	    {System.out.println("Token PROGRAM_END, encontrado Lexema "+ yytext()); }
{MIDDLE}	        {System.out.println("Token MIDDLE, encontrado Lexema "+ yytext()); }
{ESPACIO}		{/* no se realiza accion por lo tanto se ignoran*/}
{COMENTARIO}	{/* No se realiza accion por lo tanto se ignoran*/}

}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }






















