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
        if (revoluciones-ROZAMIENTO <0) {
            return 0;
        } else {
            return revoluciones - ROZAMIENTO;
        }
    }
}
