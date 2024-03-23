/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio3;

/**
 *
 * @author carme
 */
public class EmpleadoMedioTiempoBuilder extends EmpleadoBuilder{
    @Override
    public EmpleadoBuilder build(String nombre, String dni, String cargo) {
        empleado.setNombre(nombre);
        empleado.setDni(dni);
        empleado.setCargo(cargo);
        empleado.setTipoContrato("Medio Tiempo");
        return this;
    }

}
