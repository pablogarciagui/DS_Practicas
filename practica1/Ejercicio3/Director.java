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
    
    public void construirEmpleadoMedioTiempo(EmpleadoBuilder builder){
        builder.setCargo("informatico");
        builder.setDni("77321234C");
        builder.setNombre("Alberto");
        builder.setTipoContrato("Empleado Medio Tiempo");
    }
    
    public void construirEmpleadoTiempoCompleto(EmpleadoBuilder builder){
        builder.setCargo("matemática");
        builder.setDni("12345678A");
        builder.setNombre("Ana");
        builder.setTipoContrato("Empleado Tiempo Completo");
    }
    
    
}
