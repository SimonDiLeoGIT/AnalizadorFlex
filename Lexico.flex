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


}

[^]		{ throw new Error("Caracter no permitido: <" + yytext() + "> en la linea " + yyline); }






















