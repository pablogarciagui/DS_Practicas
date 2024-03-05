/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio1;

/**
 *
 * @author carmenxufdz
 */
public class FactoriaCarretera implements FactoriaCarreraYBicicleta {

    @Override
    public Carrera crearCarrera() {
        return new CarreraCarretera();
    }

    @Override
    public Bicicleta crearBicicleta(int id) {
        return new BicicletaCarretera(id);
    }
    
}
