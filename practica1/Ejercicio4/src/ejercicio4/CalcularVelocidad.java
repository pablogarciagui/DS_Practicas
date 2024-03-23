/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;


import controlador.EstadoMotor;

public class CalcularVelocidad implements Filtro{
    private double incrementoVelocidad;

    private int MAX_REVOLUCIONES = 5000;


    CalcularVelocidad(){
        this.incrementoVelocidad = 0;
    }


    @Override
    public double ejecutar(double revoluciones, EstadoMotor estadomotor){
        switch (estadomotor) {
            case APAGADO:
                incrementoVelocidad = 0;
                break;
            
            case ENCENDIDO:
                incrementoVelocidad = 0;
                break;
        
            case ACELERANDO:
                incrementoVelocidad = 100;
                break;

            case FRENANDO:
                incrementoVelocidad = -100;
                break;

            default:
                break;
        }

        if((revoluciones + incrementoVelocidad) <= MAX_REVOLUCIONES)
            revoluciones += incrementoVelocidad;

        return revoluciones;
    }
}
