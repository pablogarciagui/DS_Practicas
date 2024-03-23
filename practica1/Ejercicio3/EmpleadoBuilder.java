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
    
    protected String nombre;
    protected String dni;
    protected String cargo;
    protected String tipoContrato;

    public EmpleadoBuilder() {
        createNewEmpleado();
    }

    public abstract void createNewEmpleado();
    public abstract void setNombre(String nombre);
    public abstract void setDni(String dni);
    public abstract void setCargo(String cargo);
    public abstract void setTipoContrato(String tipoContrato);
}