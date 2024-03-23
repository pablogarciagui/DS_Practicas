/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio3;

/**
 *
 * @author carme
 */
public class Director {
    EmpleadoBuilder builder;
    Director(EmpleadoBuilder builder)
    {
        this.builder = builder;
    }
    
    public Empleado buildEmpleado(String nombre, String DNI, String cargo) {
        this.builder.build(nombre, DNI, cargo);
        return this.builder.getEmpleado();
    }
}
