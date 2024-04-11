/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio3;

/**
 *
 * @author carme
 */
public abstract class EmpleadoBuilder {
    protected Empleado empleado;

    
    public EmpleadoBuilder()
    {
        empleado = new Empleado("", "", "", "");
    }

    public abstract EmpleadoBuilder build(String nombre, String dni, String cargo);
    
    public Empleado getEmpleado() {
        return empleado;
    }
}
