/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio1;

import java.util.ArrayList;

/**
 *
 * @author carmenxufdz
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int num_bicicletas = 0;
        if(args.length != 1){
            System.out.println("ERROR: Es necesario un solo argumento");
            System.exit(1);
        }
        else{
            num_bicicletas = Integer.parseInt(args[0]);
        }
        System.out.println("==========| COMIENZA LA CARRERA |==========");
        
        // CREAMOS FACTORIAS
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();
        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        
        // Creamos tantas bicicletas como se indica en el argumento

        ArrayList<Bicicleta> auxBCarretera = new ArrayList<Bicicleta>();
        ArrayList<Bicicleta> auxBMontana = new ArrayList<Bicicleta>();

        for(int i = 0; i< num_bicicletas; i++){
            auxBCarretera.add(factoriaCarretera.crearBicicleta(i));
            // Para diferenciarlas fácilmente usamos distintos ids en cada tipo de carrera
            auxBMontana.add(factoriaMontana.crearBicicleta(i+num_bicicletas));
        }

        // Cada factoria crea su carrera
        Carrera carreraCarretera = factoriaCarretera.crearCarrera();
        Carrera carreraMontana = factoriaMontana.crearCarrera();
        
        // Se introducen las carreras en las bicicletas
        carreraCarretera.addNumBicicletas(auxBCarretera);
        carreraMontana.addNumBicicletas(auxBMontana);
        
        Thread h1 = new Thread(carreraCarretera);
        Thread h2 = new Thread(carreraMontana);
        
        // Se inician las hebras
        h1.start();
        h2.start();
        
        // Esperamos a que se unan las hebras
        try{
            h1.join();
        } catch (InterruptedException e){
            e.printStackTrace();
        }

        try{
            h2.join();
        } catch (InterruptedException e){
            e.printStackTrace();
        }
    
    }
    
}
