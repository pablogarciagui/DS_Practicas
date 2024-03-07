/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio1;

/**
 *
 * @author carmenxufdz
 */
public class CarreraMontana extends Carrera{
    CarreraMontana(){
        super();
        porcent_retirada = 0.1f;
    }

    @Override
    public void comenzarCarrera(){
        System.out.println("!CarreraMontana esta comenzando!");
    }

    @Override
    public void acabarCarrera(){
        super.acabarCarrera();
        System.out.println("¡Termina CarreraMontana!");
    }
    @Override
    public void retirarBicicletasPorcentaje(){
        super.retirarBicicletasPorcentaje();
        System.out.println("Se retiran "+ porcent_retirada + "% de CarreraMontana");
    }
}
