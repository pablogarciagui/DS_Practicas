/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio1;

/**
 *
 * @author carmenxufdz
 */
public class CarreraCarretera extends Carrera {
    CarreraCarretera(){
        super();
        porcent_retirada = 0.2f;
    }

    @Override
    public void comenzarCarrera(){
        System.out.println("¡CareraCarretera esta comenzando!");
    }

    @Override
    public void acabarCarrera(){
        super.acabarCarrera();
        System.out.println("¡Termina CareraCarretera!");
    }

    @Override
    public void retirarBicicletasPorcentaje(){
        super.retirarBicicletasPorcentaje();
        System.out.println("Se retiran "+ porcent_retirada*100 + "% de CareraCarretera");
    }

    @Override
    public void retirarBicicleta(){
        super.retirarBicicleta();
        System.out.print("CarreraCarretera\n");
    }
}
