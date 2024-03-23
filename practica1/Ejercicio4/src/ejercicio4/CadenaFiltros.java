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

    void peticionFiltros(double revoluciones, EstadoMotor estadoMotor){
        filtros.forEach((filtro)->filtro.ejecutar(revoluciones, estadoMotor));
        objetivo.ejecutar(revoluciones, estadoMotor);
    }

    void ejecutar (double revoluciones, EstadoMotor estadoMotor){
        filtros.forEach((filtro)->filtro.ejecutar(revoluciones, estadoMotor));
        objetivo.ejecutar(revoluciones, estadoMotor);
    }
}
