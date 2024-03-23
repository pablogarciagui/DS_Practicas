/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package ejercicio1;
import java.util.ArrayList;
import java.util.Random;
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
        // Generamos un tiempo aleatorio menor que DURACIÓN, porque las bicicletas se deben retirar antes
        Random rand = new Random(); 
        int r = rand.nextInt(DURACION-1);
        
        // Comenzamos la carrera
        comenzarCarrera();

        // La hebra no hace nada durante ese tiempo aleatorio
        try {
            Thread.sleep(r*1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // Retira las bicicletas correspondientes al porcentaje
        retirarBicicletasPorcentaje();

        // Espera el tiempo de carrera que queda
        try {
            Thread.sleep((DURACION-r)*1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        // Termina la carrera
        acabarCarrera();
    }

    Carrera() {
        num_bicicletas = 0;
        bicicletas = new ArrayList<Bicicleta>();
    }

    public void comenzarCarrera(){
        // Cada tipo de carrera tendra su cierre
    }

    public void acabarCarrera(){
        retirarBicicletasTodas();
        System.out.println("Todas las bicicletas se retiran");
    }

    public void retirarBicicleta(){
        int last_id = num_bicicletas-1;
        if (last_id >= 0) {
            System.out.print("Bicicleta "+ bicicletas.get(last_id).idBicicleta + " se retira de ");
            bicicletas.remove(last_id);
            num_bicicletas--;
        }
    }

    public void retirarBicicletasPorcentaje(){
        int n_retirar = (int) Math.ceil(porcent_retirada*num_bicicletas);
        for(int i = 0; i < n_retirar; i++){
            retirarBicicleta();
        }
    }

    public void retirarBicicletasTodas(){
        bicicletas.clear();
        num_bicicletas=0;
    }

    public void anadirBicicleta(Bicicleta bicicleta){
        if (bicicleta != null) {
            bicicletas.add(bicicleta);
            num_bicicletas++;
        }
    }

    public void addNumBicicletas(ArrayList<Bicicleta> bicis){
        if (bicis != null) {
            bicicletas.addAll(bicis);
            num_bicicletas+=bicis.size();
        }
    }
        
}
