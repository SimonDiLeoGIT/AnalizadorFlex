# Analizador Lexico

## Instrucciones

-   Agregar el jar de javacup (java-cup-11b-runtime_2) al build path del proyecto java.
-   Crear el archivo 'prueba.txt' con las cadenas que se quieren detectar
-   Ejecutar la aplicación

## Error Lexico.java

Si realizas un cambio en el archivo Lexico.flex y lo compilas usando el jar de jflex, el archivo Lexico.java marca error en una linea específica.

### Solucion

El error lo marca en el valor de retorno de esta linea

```java
    return new java_cup.runtime.Symbol(sym.EOF);
```

La solucion es cambiar para que retorne null y asi funciona

```java
    return null;
```
