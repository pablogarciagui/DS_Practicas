/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio1;

/**
 *
 * @author carmenxufdz
 */
public class FactoriaMontana implements FactoriaCarreraYBicicleta {

    @Override
    public Carrera crearCarrera() {
        return new CarreraMontana();
    }

    @Override
    public Bicicleta crearBicicleta() {
        return new BicicletaMontana();
    }
    
}
