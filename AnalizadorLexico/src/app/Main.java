/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;


public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        try {
            // TODO code application logic here
            FileReader f = new FileReader("C:/prueba.txt");
            Lexico Lexer = new Lexico(f);
            Lexer.next_token();
        } catch (FileNotFoundException ex) {
            System.out.println("No se encontró el archivo");
        }
        
    }
    
}
