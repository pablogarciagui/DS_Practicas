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
    
    public String toString(){
        String string="";
        string += "Nombre: "+ this.nombre+" \n";
        string += "\tDNI: "+ this.dni+" \n";
        string += "\tCargo: "+ this.cargo+" \n";
        string += "\tContrato actual: "+ this.tipo_contrato+" \n";
        return string;
    };

    // Si vemos que no hace falta esto se quita
    public void addEmpleado(Empleado empleado){
        System.out.println("Un empleado no puede contener elementos jerarquicos");
    };
    public void addDepartamento(Departamento departamento){
        System.out.println("Un empleado no puede contener elementos jerarquicos");
    };
    public void removeEmpleado(String dni){
        System.out.println("Un empleado no puede contener elementos jerarquicos");
    };
    public void removeDepartamento(String nombre){
        System.out.println("Un empleado no puede contener elementos jerarquicos");
    };
   
}
