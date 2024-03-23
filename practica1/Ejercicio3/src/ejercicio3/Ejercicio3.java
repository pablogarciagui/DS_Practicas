/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio3;

/**
 *
 * @author carme
 */
public class Ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        EmpleadoMedioTiempoBuilder MedioBuilder = new EmpleadoMedioTiempoBuilder();
        Director director = new Director(MedioBuilder);
        
        Empleado empleado =  director.buildEmpleado("Juan", "75914632Y", "Jefe de equipo");
        System.out.println("Empleado1:\n" + empleado.toString());
        
        EmpleadoTiempoCompletoBuilder CompletoBuilder = new EmpleadoTiempoCompletoBuilder();
        
        director = new Director(CompletoBuilder);
        Empleado empleado2 = director.buildEmpleado("Juan", "75914632Y", "Diseñador");
        System.out.println("Empleado2:\n" + empleado2.toString());
        
        // Con esto hemos comprobado la correcta funcionalidad del patron
        
        
        Departamento departamentoinfo = new Departamento("Departamento de Lenguajes y Sistemas Informáticos");
        Departamento departamentods = new Departamento("Subdepartamento de Desarrollo Software");
        
        departamentoinfo.addDepartamento(departamentoinfo);
        departamentoinfo.addEmpleado(empleado);
        departamentoinfo.addEmpleado(empleado); //añadimos dos veces al mismo para ver que no nos deja
        
        departamentoinfo.addDepartamento(departamentods);
        departamentods.addEmpleado(empleado2);
        
        System.out.println(departamentoinfo.toString());
        
        departamentods.removeDepartamento("Departamento de Álgebra"); //no existe
        
        departamentoinfo.removeDepartamento("Subdepartamento de Desarrollo Software");
        
        System.out.println(departamentoinfo.toString());
        
    }
    
}
