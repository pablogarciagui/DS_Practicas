/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ejercicio1;
import java.util.ArrayList;
/**
 *
 * @author carmenxufdz
 */
public abstract class Carrera implements Runnable{
    ArrayList<Bicicleta> bicicletas;
    int num_bicicletas;
    float porcent_retirada;

    private static final int DURACION = 60;

    public void run(){
        num_bicicletas = 0;
        bicicletas = new ArrayList<Bicicleta>();
    }

    public void comenzarCarrera(){

    }

    public void acabarCarrera(){

    }
    
    public void retirarBicicleta(){

    }
    public void retirarBicicletasPorcentaje(){

    }

    public void retirarBicicletasTodas(){

    }

    public void anadirBicicleta(Bicicleta bicicleta){

    }

    public void setNumBicicletas(int num_bicicletas){

    }
        
}
