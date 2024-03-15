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
    public EmpleadoMedioTiempoBuilder tipoContrato(String tipoContrato)
    {
        super.tipo_contrato = tipoContrato;
        return this;
    }

}
