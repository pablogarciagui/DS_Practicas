/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ejercicio1;

/**
 *
 * @author carmenxufdz
 */
public abstract class Bicicleta {
    protected int idBicicleta;
    
    Bicicleta(int id)
    {
        idBicicleta = id;
    }

    public void correr(){
        System.out.println("Bicicleta " + idBicicleta + " corriendo.");    
    }

    public void anuncioRetirada(){
        System.out.println("Bicicleta " + idBicicleta + " se retira.");
    }
}
