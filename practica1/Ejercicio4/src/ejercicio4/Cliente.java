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
public class Cliente {
    private GestorFiltros gestorFiltros;
    
    public Cliente(GestorFiltros gestor){
        this.gestorFiltros = gestor;
    }
    
    public void peticionGestorFiltros(EstadoMotor estadoMotor){
        gestorFiltros.peticionCadenaFiltros(estadoMotor);
    }
}
