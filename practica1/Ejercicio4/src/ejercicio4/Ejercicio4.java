/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ejercicio4;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.swing.SwingUtilities;

import controlador.Mandos;
import vista.Interfaz;
import vista.Salpicadero;

/**
 *
 * @author carme
 */
public class Ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Objetivo objetivo = new Objetivo();
        GestorFiltros gestorFiltros = new GestorFiltros(objetivo);
        gestorFiltros.addFiltro(new CalcularVelocidad());
        gestorFiltros.addFiltro(new RepercutirRozamiento());

        Salpicadero salpicadero = new Salpicadero(objetivo);
        Cliente cliente = new Cliente(gestorFiltros);
        Mandos mandos = new Mandos(cliente, salpicadero);
        Interfaz interfaz = new Interfaz(mandos,salpicadero);

        interfaz.setVisible(true);
        // ScheduledExecutorService executorService = Executors.newScheduledThreadPool(1);
        // interfaz.setVisible(true);
        // SwingUtilities.invokeLater(new Runnable() {
        //     @Override
        //     public void run() {
                
        //         executorService.scheduleAtFixedRate(mandos, 0, 1, TimeUnit.SECONDS);
        //     }
        // });
    }

}
