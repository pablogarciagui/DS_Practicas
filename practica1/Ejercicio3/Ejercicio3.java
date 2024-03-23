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
        
        //comprobamos si funciona bien el patron builder
        
        Director director = new Director();
        
        // Director gets the concrete builder object from the client
        // (application code). That's because application knows better which
        // builder to use to get a specific product.
        
        EmpleadoMedioTiempoBuilder medioBuilder = new EmpleadoMedioTiempoBuilder();
        director.construirEmpleadoMedioTiempo(medioBuilder);
        
        // The final product is often retrieved from a builder object, since
        // Director is not aware and not dependent on concrete builders and
        // products.
        
        Empleado empleado = medioBuilder.getResult();
        System.out.println("Empleado1:\n" + empleado.toString());
        
        EmpleadoTiempoCompletoBuilder completoBuilder = new EmpleadoTiempoCompletoBuilder();
        
        // Director may know several building recipes.
        
        director.construirEmpleadoTiempoCompleto(completoBuilder);
        Empleado empleado2 = completoBuilder.getResult();
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
