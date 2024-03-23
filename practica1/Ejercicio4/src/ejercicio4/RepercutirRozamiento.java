/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

import controlador.EstadoMotor;

public class RepercutirRozamiento implements Filtro{
    private int ROZAMIENTO;

    RepercutirRozamiento(){

        this.ROZAMIENTO = 30;
    }

    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadomotor){
        return revoluciones - ROZAMIENTO;
    }
}
