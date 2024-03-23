/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

import java.util.ArrayList;

import controlador.EstadoMotor;

/**
 *
 * @author carme
 */
public class CadenaFiltros {
    Objetivo objetivo;
    ArrayList<Filtro> filtros;

    CadenaFiltros(){
        this.filtros = new ArrayList<Filtro>();
    }

    void peticionFiltros(){
        ejecutar();
    }

    void ejecutar (){
        double revoluciones_recalculadas=objetivo.getRevoluciones();
        EstadoMotor estadoMotor= objetivo.getEstado();
        for(int i=0;i < filtros.size();i++){
            revoluciones_recalculadas+=filtros.get(i).ejecutar(revoluciones_recalculadas, estadoMotor);
        };
        objetivo.ejecutar(revoluciones_recalculadas, estadoMotor);
    }
}
