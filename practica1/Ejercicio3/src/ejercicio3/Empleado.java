/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio3;

/**
 *
 * @author carme
 */
public class Empleado {
    String nombre;
    String dni;
    String cargo;
    String tipo_contrato;
    
    Empleado(EmpleadoBuilder builder)
    {
        this.nombre = builder.nombre;
        this.dni = builder.dni;
        this.cargo = builder.cargo;
        this.tipo_contrato = builder.tipo_contrato;
    }
}
