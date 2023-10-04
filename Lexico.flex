package app;
import java_cup.runtime.*;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

%%

%cup
%public
%class Lexico
%line
%column
%char

%{
    private ArrayList<String> lista = new ArrayList<>();
    private ArrayList<SymbolTableEntry> tsEntries = new ArrayList<>();
    private PrintWriter writer = null;

    public Lexico(java.io.Reader in, String filePath) {
        this.zzReader = in;
        try {
            File file = new File(filePath);
            file.createNewFile();
            writer = new PrintWriter(new FileWriter(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList getList() {
        return this.lista;
    }

    public void vaciarLista() {
        this.lista.clear();
    }

    public void agregarATablaDeSimbolos(String token, String valor) {
        boolean existe = false;
        for (SymbolTableEntry entrada : tsEntries) {
            if (entrada.getToken().equals(token) && ((entrada.getNombre().equals(valor)) || (entrada.getNombre().equals("_" + valor)))) {
                existe = true;
            }
        }

        if (!existe) tsEntries.add(new SymbolTableEntry(valor, token));
    }
%}


%eof{
    if (writer != null) {
    	String header = String.format("%-25s | %-15s | %-10s | %-25s |%-5s", "NOMBRE", "TOKEN", "TIPO", "VALOR", "LONGITUD");
    	writer.println(header);
    	for(SymbolTableEntry entryInstance: tsEntries) {
    		String entry = entryInstance.getEntry();
    		writer.println(entry);
    	}
        
        writer.close();
    }
%eof}

LETRA = [a-zA-Z]
DIGITO = [0-9]
ESPACIO = [ \t\f\n\r\n]+
OP_SUMA = "+"
OP_RESTA = "-"
OP_DIV = "/"
OP_MULT = "*"
OP_MOD = "%"
OP_POT = "^"
OP_MAY_IG = ">="
OP_MEN_IG = "<="
OP_DIST = "<>"
OP_MEN = "<"
OP_MAY = ">"
OP_IG = "=="
OP_ASIGN = "="
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
WRITE = "WRITE"|"write"|"Write"
CONST_INT = {DIGITO}+
CONST_DOU = ({DIGITO}* "." {DIGITO}+) | ({DIGITO}+ "." {DIGITO}*)
CONST_STR = "'" ({DIGITO}|{LETRA}|{ESPACIO})* "'"     // Agregar la posibildad de cualquier elemento y espacios
CONST_BIN = "(" {ESPACIO}* ("0"|"1")+ {ESPACIO}* "," {ESPACIO}* "2" {ESPACIO}* ")"
CONST_HEX = "(" {ESPACIO}* ({DIGITO} | "A" | "B" | "C" | "D" | "E" | "F")+ {ESPACIO}* "," {ESPACIO}* "16" {ESPACIO}* ")"
INTEGER = "INTEGER"|"integer"|"Integer"
STRING = "STRING"|"string"|"String"
FLOAT = "FLOAT"|"float"|"Float"
COMMENT = "/*" ~ "*/" // El simbolo ~ incluye cualquier caracter
INLINE_COMMENT = "</" ~ "/>" // El simbolo ~ incluye cualquier caracter
WHILE = "WHILE"|"while"|"While"
IF = "IF"|"if"|"If"
ELSE = "ELSE"|"else"|"Else"
DEFINE = "DEFINE" | "define"
DEFINE_END = "ENDDEFINE"|"enddefine"
PROGRAM_BEGIN = "PROGRAM"|"program"
PROGRAM_END = "END"|"end"
MIDDLE = "MIDDLE"|"Middle"|"middle"
ID = {LETRA} ({LETRA} | {DIGITO} | _ ({LETRA}|{DIGITO}))*


%%

<YYINITIAL> {


{OP_IG} {
    lista.add("Token OP_IG, encontrado Lexema "+ yytext());
    System.out.println("Token OP_IG, encontrado Lexema "+ yytext());
} 
{OP_ASIGN} {
    System.out.println("Token OP_ASIGN encontrado, Lexema: "+ yytext());
    lista.add("Token OP_ASIGN, encontrado Lexema "+ yytext());
}
{OP_SUMA} {
    System.out.println("Token OP_SUMA encontrado, Lexema "+ yytext());
    lista.add("Token OP_SUMA, encontrado Lexema "+ yytext());
}
{OP_RESTA} {
    System.out.println("Token OP_RESTA encontrado, Lexema "+ yytext());
    lista.add("Token OP_RESTA, encontrado Lexema "+ yytext());
}
{OP_DIV} {
    System.out.println("Token OP_DIV encontrado, Lexema "+ yytext());
    lista.add("Token OP_DIV, encontrado Lexema "+ yytext());
}
{OP_MULT} {
    System.out.println("Token OP_MULT encontrado, Lexema "+ yytext());
    lista.add("Token OP_MULT, encontrado Lexema "+ yytext());
}
{OP_MOD} {
    System.out.println("Token OP_MOD encontrado, Lexema "+ yytext());
    lista.add("Token OP_MOD, encontrado Lexema "+ yytext());
}
{OP_POT} {
    System.out.println("Token OP_POT encontrado, Lexema "+ yytext());
    lista.add("Token OP_POT, encontrado Lexema "+ yytext());
}
{OP_MAY_IG} {
    System.out.println("Token OP_MAY_IG encontrado, Lexema "+ yytext());
    lista.add("Token OP_MAY_IG, encontrado Lexema "+ yytext());
}
{OP_MEN_IG} {
    System.out.println("Token OP_MEN_IG encontrado, Lexema "+ yytext());
    lista.add("Token OP_MEN_IG, encontrado Lexema "+ yytext());
}
{OP_MEN} {
    System.out.println("Token OP_MEN encontrado, Lexema "+ yytext());
    lista.add("Token OP_MEN, encontrado Lexema "+ yytext());
}
{OP_MAY} {
    System.out.println("Token OP_MAY encontrado, Lexema "+ yytext());
    lista.add("Token OP_MAY, encontrado Lexema "+ yytext());
}
{OP_DIST} {
    System.out.println("Token OP_DIST, Lexema "+ yytext());
    lista.add("Token OP_DIST, encontrado Lexema "+ yytext());
} 
{OP_AND} {
    System.out.println("Token OP_AND, encontrado Lexema "+ yytext());
    lista.add("Token OP_AND, encontrado Lexema "+ yytext());
} 
{OP_OR} {
    System.out.println("Token OP_OR, encontrado Lexema "+ yytext());
    lista.add("Token OP_OR, encontrado Lexema "+ yytext()); 
}
{OP_NOT} {
    System.out.println("Token OP_NOT, encontrado Lexema "+ yytext());
    lista.add("Token OP_NOT, encontrado Lexema "+ yytext());
} 
{PAREN_OPEN} {
    System.out.println("Token PAREN_OPEN, encontrado Lexema "+ yytext());
    lista.add("Token PAREN_OPEN, encontrado Lexema "+ yytext()); 
}
{PAREN_CLOSE} {
    System.out.println("Token PAREN_CLOSE, encontrado Lexema "+ yytext());
    lista.add("Token PAREN_CLOSE, encontrado Lexema "+ yytext()); 
}
{BLOCK_BEG} {
    System.out.println("Token BLOCK_BEG, encontrado Lexema "+ yytext());
    lista.add("Token BLOCK_BEG, encontrado Lexema "+ yytext()); 
}
{BLOCK_END} {
    System.out.println("Token BLOCK_END, encontrado Lexema "+ yytext());
    lista.add("Token BLOCK_END, encontrado Lexema "+ yytext()); 
}
{BRACK_OPEN} {
    System.out.println("Token BRACK_OPEN, encontrado Lexema "+ yytext());
    lista.add("Token BRACK_OPEN, encontrado Lexema "+ yytext()); 
}
{BRACK_CLOSE} {
    System.out.println("Token BRACK_CLOSE, encontrado Lexema "+ yytext());
    lista.add("Token BRACK_CLOSE, encontrado Lexema "+ yytext()); 
}
{PUNTO_COMA} {
    System.out.println("Token PUNTO_COMA, encontrado Lexema "+ yytext());
    lista.add("Token PUNTO_COMA, encontrado Lexema "+ yytext()); 
}
{COMA} {
    System.out.println("Token COMA, encontrado Lexema "+ yytext());
    lista.add("Token COMA, encontrado Lexema "+ yytext()); 
}
{PUNTO} {
    System.out.println("Token PUNTO, encontrado Lexema "+ yytext());
    lista.add("Token PUNTO, encontrado Lexema "+ yytext()); 
}
{DOS_PUNTOS} {
    System.out.println("Token DOS_PUNTOS, encontrado Lexema "+ yytext());
    lista.add("Token DOS_PUNTOS, encontrado Lexema "+ yytext()); 
}
{WRITE} {
    System.out.println("Token WRITE, encontrado Lexema "+ yytext());
    lista.add("Token WRITE, encontrado Lexema "+ yytext()); 
}
{CONST_INT}	          {
    System.out.println("Token CONST_INT, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("CONST_INT", yytext());
    lista.add("Token CONST_INT, encontrado Lexema "+ yytext()); 
} /* recordar que no debe exceder los 16 bits 0 < entero < 32768 */
{CONST_DOU} {
    System.out.println("Token CONST_DOU, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("CONST_DOU", yytext());
    lista.add("Token CONST_DOU, encontrado Lexema "+ yytext()); 
} /* recordar que no debe exceder los 32 bits */
{CONST_STR} {
    System.out.println("Token CONST_STR, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("CONST_STR", yytext());
    lista.add("Token CONST_STR, encontrado Lexema "+ yytext()); 
}
{CONST_BIN} {
    System.out.println("Token CONST_BIN, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("CONST_BIN", yytext());
    lista.add("Token CONST_BIN, encontrado Lexema "+ yytext()); 
}
{CONST_HEX} {
    System.out.println("Token CONST_HEX, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("CONST_HEX", yytext());
    lista.add("Token CONST_HEX, encontrado Lexema "+ yytext()); 
}
{INTEGER}  {
    System.out.println("Token INTEGER, encontrado Lexema "+ yytext()); 
    lista.add("Token INTEGER, encontrado Lexema "+ yytext()); 
}
{STRING} {
    System.out.println("Token STRING, encontrado Lexema "+ yytext());
    lista.add("Token STRING, encontrado Lexema "+ yytext()); 
}
{FLOAT} {
    System.out.println("Token FLOAT, encontrado Lexema "+ yytext()); 
    lista.add("Token FLOAT, encontrado Lexema "+ yytext()); 
}
{WHILE} {
    System.out.println("Token WHILE, encontrado Lexema "+ yytext());
    lista.add("Token WHILE, encontrado Lexema "+ yytext()); 
}
{IF} {
    System.out.println("Token IF, encontrado Lexema "+ yytext());
    lista.add("Token IF, encontrado Lexema "+ yytext()); 
}
{ELSE} {
    System.out.println("Token ELSE, encontrado Lexema "+ yytext());
    lista.add("Token ELSE, encontrado Lexema "+ yytext()); 
}
{DEFINE}  {
    System.out.println("Token DEFINE, encontrado Lexema "+ yytext());
    lista.add("Token DEFINE, encontrado Lexema "+ yytext()); 
}
{DEFINE_END} {
    System.out.println("Token DEFINE_END, encontrado Lexema "+ yytext());
    lista.add("Token DEFINE_END, encontrado Lexema "+ yytext()); 
}
{PROGRAM_BEGIN} {
    System.out.println("Token PROGRAM_BEGIN, encontrado Lexema "+ yytext());
    lista.add("Token PROGRAM_BEGIN, encontrado Lexema "+ yytext());
}
{PROGRAM_END} {
    System.out.println("Token PROGRAM_END, encontrado Lexema "+ yytext());
    lista.add("Token PROGRAM_END, encontrado Lexema "+ yytext()); 
}
{MIDDLE}  {
    System.out.println("Token MIDDLE, encontrado Lexema "+ yytext());
    lista.add("Token MIDDLE, encontrado Lexema "+ yytext()); 
}
{ID} {
    lista.add("Token ID, encontrado Lexema "+ yytext());
    System.out.println("Token ID, encontrado Lexema "+ yytext()); 
    agregarATablaDeSimbolos("ID", yytext());
}
{ESPACIO}		      {/* no se realiza accion por lo tanto se ignoran*/}
{COMMENT}	          {/* no se realiza accion por lo tanto se ignoran*/}
{INLINE_COMMENT}	  {/* no se realiza accion por lo tanto se ignoran*/}

}

[^]		{ throw new Exception("Caracter no permitido: <" + yytext() + "> en la linea: " + (yyline + 1) + " columna: " + (yycolumn + 1)); }


















