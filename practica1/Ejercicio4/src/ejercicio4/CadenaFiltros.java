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

    CadenaFiltros(Objetivo objetivo){
        this.objetivo = objetivo;
        this.filtros = new ArrayList<Filtro>();
    }

    void peticionFiltros(EstadoMotor estadoMotor){
        objetivo.setEstadoMotor(estadoMotor);
        ejecutar();
    }

    void ejecutar (){
        double revoluciones_recalculadas = this.objetivo.getRevoluciones();
        EstadoMotor estadoMotor = this.objetivo.getEstado();
        for(int i=0;i < this.filtros.size();i++){
            revoluciones_recalculadas=this.filtros.get(i).ejecutar(revoluciones_recalculadas, estadoMotor);
        };
        this.objetivo.ejecutar(revoluciones_recalculadas, estadoMotor);
    }

    void addFiltro(Filtro filtro){
        this.filtros.add(filtro);
    }
}
