package app;

public class SymbolTableEntry {
	String nombre;
	String token;
	String tipo;
	String valor;
	String longitud;
	
	public SymbolTableEntry (String valor, String token) {
		this.nombre = "_" + valor;
		this.token = token;
		this.tipo = "-";
		this.longitud = "-";
		this.valor = valor;
		if(this.token.equals("CONST_STR")) {
			this.valor = this.valor.substring(1, this.valor.length() - 1);
		    this.nombre = "_" + this.valor;
			Integer longitudAsInt = this.valor.length();
			this.longitud =  longitudAsInt.toString();    
		}
		
		if(this.token.equals("ID")) {
			this.tipo = " ";
			this.nombre = valor;
			this.valor = "-";
		}
	}
	
	public String getEntry() {
		return String.format("%-20s | %-10s | %-10s | %-20s |%-10s", nombre, token, tipo, valor, longitud);
	}
	
}
