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
    public final String nombre;
    public final String dni;
    public final String cargo;
    public final String tipo_contrato;
    
    public Empleado(String nombre, String dni, String cargo, String tipoContrato)
    {
        this.nombre = nombre;
        this.dni = dni;
        this.cargo = cargo;
        this.tipo_contrato = tipoContrato;
    }
       
    
    public String toString(){
        String string="";
        string += "Nombre: "+ this.nombre+" \n";
        string += "\tDNI: "+ this.dni+" \n";
        string += "\tCargo: "+ this.cargo+" \n";
        string += "\tContrato actual: "+ this.tipo_contrato+" \n";
        return string;
    };
    
    
    
    
    
    
    /*
    
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
    
    */
   
}
