/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

import controlador.EstadoMotor;

/**
 *
 * @author jesus
 */
public class GestorFiltros {
    private CadenaFiltros cadenaFiltros;
    
    public GestorFiltros(Objetivo objetivo){
        this.cadenaFiltros = new CadenaFiltros(objetivo);
    }
    
    public void addFiltro (Filtro filtro){
        cadenaFiltros.addFiltro(filtro);
    }
    
    public void peticionCadenaFiltros(EstadoMotor estadoMotor) {
        System.err.println("Peticion");
        cadenaFiltros.peticionFiltros(estadoMotor);
    }
}
