/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio1;

/**
 *
 * @author carmenxufdz
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int num_bicicletas;
        if(args.length != 2){
            System.out.println("ERROR: Es necesario un argumento");
            System.exit(1);
        }
        else{
            num_bicicletas = Integer.parseInt(args[1]);
        }
        System.out.println("==========| COMIENZA LA CARRERA |==========");
        
        // CREAMOS FACTORIAS
        FactoriaCarreraYBicicleta factoriaCarretera = new FactoriaCarretera();
        FactoriaCarreraYBicicleta factoriaMontana = new FactoriaMontana();
        
        // Cada factoria crea su carrera
        Carrera carreraCarretera = factoriaCarretera.crearCarrera();
        Carrera carreraMontana = factoriaMontana.crearCarrera();
        
        
        
        Thread h1 = new Thread(carreraCarretera);
        Thread h2 = new Thread(carreraMontana);
        
        h1.run();
        h2.run();
        
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
