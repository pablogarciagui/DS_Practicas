/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio3;

/**
 *
 * @author carme
 */
public class EmpleadoMedioTiempoBuilder extends EmpleadoBuilder {
    @Override
    public void createNewEmpleado() {
        this.tipoContrato = "Medio tiempo";
    }

    @Override
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public void setDni(String dni) {
        this.dni = dni;
    }

    @Override
    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    @Override
    public void setTipoContrato(String tipoContrato) {
        this.tipoContrato = tipoContrato;
    }
    
    public Empleado getResult(){
        return new Empleado(nombre, dni, cargo, tipoContrato);
    }
}
