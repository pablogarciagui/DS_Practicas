/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ejercicio4;

import controlador.EstadoMotor;

/**
 *
 * @author carme
 */
public interface Filtro {
    static final int DISMINUCION = -1;
    double ejecutar(double revoluciones, EstadoMotor estadoMotor);
}
