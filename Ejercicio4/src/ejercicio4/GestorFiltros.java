/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

/**
 *
 * @author jesus
 */
public class GestorFiltros {
    private CadenaFiltros cadenaFiltros;
    
    public GestorFiltros(){
        this.cadenaFiltros = new CadenaFiltros();
    }
    
    public void addFiltro (Filtro filtro){
        cadenaFiltros.addFiltro(filtro);
    }
    
    public void peticionCadenaFiltros() {
        cadenaFiltros.ejecutar();
    }
}
