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
    String nombre;
    String dni;
    String cargo;
    String tipo_contrato;

    public EmpleadoBuilder name(String name) {
        this.nombre = name;
        return this;
    }

    public EmpleadoBuilder dni(String dni) {
        this.dni = dni;
        return this;
    }

    public EmpleadoBuilder jobTitle(String jobTitle) {
        this.cargo = jobTitle;
        return this;
    }

    public Empleado build() {
        return new Empleado(this);
    }

    public abstract EmpleadoBuilder tipoContrato(String tipoContrato);
}
