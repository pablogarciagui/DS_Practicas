/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import javax.swing.JLabel;
import javax.swing.JToggleButton;

/**
 *
 * @author jesus
 */

public class Mandos {
    private JToggleButton botonAcelerador;
    private JToggleButton botonEncendido;
    private JToggleButton botonFreno;
    private JLabel estado;
    private EstadoMotor comandoActual; 
    private Cliente cliente; 
    private Salpicadero salpicadero;

    
    public Mandos(Cliente cliente, Salpicadero salpicadero) {
        this.cliente = cliente;
        this.salpicadero = salpicadero;
    }

    
    public void run() {
        
        botonAcelerador.addActionListener(e -> Acelerar());
        botonEncendido.addActionListener(e -> Encender());
        botonFreno.addActionListener(e -> Frenar());
    }

    
    public void Encender() {
        comandoActual = EstadoMotor.ENCENDIDO;
        estado.setText("Encendido");
        cliente.peticionGestorFiltros(); 
        salpicadero.actualizarEstado(comandoActual); 
    }

    
    public void Acelerar() {
        comandoActual = EstadoMotor.ACELERANDO;
        estado.setText("Acelerando");
        cliente.peticionGestorFiltros(); 
        salpicadero.actualizarEstado(comandoActual); 
    }

    
    public void Frenar() {
        comandoActual = EstadoMotor.FRENANDO;
        estado.setText("Frenando");
        cliente.peticionGestorFiltros(); 
        salpicadero.actualizarEstado(comandoActual); 
    }
}
