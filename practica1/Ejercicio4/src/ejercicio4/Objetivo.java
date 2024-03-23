/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

import controlador.EstadoMotor;
import controlador.Mandos;
        
/**
 *
 * @author carme
 */
public class Objetivo {
    private EstadoMotor estadomotor;
    private double distancia;
    private double distanciaTotal;


    private double revoluciones;    // Velocidad Angular RPM
    private double velocidad;       // Velocidad Lineal km/h
    public final double RADIO = 0.15;
    
    Objetivo(){
        distanciaTotal = 0;
        distancia = 0;
        velocidad = 0;
        revoluciones = 0;
        estadomotor = EstadoMotor.APAGADO;
    }
    
    public EstadoMotor getEstado()
    {
        return estadomotor;
    }
    
    public double getDistancia() {
        return distancia;
    }
        public double getDistanciaTotal() {
        return distanciaTotal;
    }

    public double getRevoluciones() {
        return revoluciones;
    }

    public double getVelocidad() {
        return velocidad;
    }
    
    public double ejecutar(double revoluciones, EstadoMotor estadomotor)
    {
        this.estadomotor = estadomotor;
        this.revoluciones = revoluciones;
        this.velocidad = 2 * Math.PI * RADIO * revoluciones * 0.06;
        this.distancia += this.velocidad/3600;
        this.distanciaTotal += this.velocidad/3600;
        
        return revoluciones;  
    }
    
    public void resetDistancia() 
    {
        distancia = 0;
    }

}
