/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package vista;

import java.awt.*;

import javax.swing.JFrame;

import controlador.Mandos;

/**
 *
 * @author carme
 */
public class Interfaz extends javax.swing.JFrame {
    Mandos mandos;
    Salpicadero salpicadero;

    /**
     * Creates new form Interfaz
     */
    public Interfaz(Mandos m, Salpicadero s) {
        mandos = m;
        salpicadero = s;
        initComponents();
        setVisible(true);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")

    private void initComponents() {
        this.setLayout(new FlowLayout(FlowLayout.CENTER, 10, 10));
        // this.setExtendedState(JFrame.MAXIMIZED_BOTH);
        this.setSize(new Dimension(1000, 600));
        this.add(salpicadero);
        this.add(mandos);
    }

    // private void initComponents() {
    //     setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
    //     setTitle("Vehiculo");

    //     javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
    //     getContentPane().setLayout(layout);
    //     layout.setHorizontalGroup(
    //             layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
    //                     .addGroup(layout.createSequentialGroup()
    //                             .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
    //                                     .addGroup(layout.createSequentialGroup()
    //                                             .addGap(20, 20, 20)
    //                                             .addComponent(mandos, javax.swing.GroupLayout.PREFERRED_SIZE, 708,
    //                                                     javax.swing.GroupLayout.PREFERRED_SIZE)
    //                                             .addGap(33, 33, 33))
    //                                     .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout
    //                                             .createSequentialGroup()
    //                                             .addContainerGap()
    //                                             .addComponent(salpicadero, javax.swing.GroupLayout.PREFERRED_SIZE,
    //                                                     javax.swing.GroupLayout.DEFAULT_SIZE,
    //                                                     javax.swing.GroupLayout.PREFERRED_SIZE)
    //                                             .addPreferredGap(
    //                                                     javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)))));
    //     layout.setVerticalGroup(
    //             layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
    //                     .addGroup(layout.createSequentialGroup()
    //                             .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
    //                                     .addGroup(layout.createSequentialGroup()
    //                                             .addGap(6, 6, 6)
    //                                             .addComponent(mandos, javax.swing.GroupLayout.PREFERRED_SIZE,
    //                                                     javax.swing.GroupLayout.DEFAULT_SIZE,
    //                                                     javax.swing.GroupLayout.PREFERRED_SIZE)
    //                                             .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
    //                                             .addComponent(salpicadero, javax.swing.GroupLayout.PREFERRED_SIZE,
    //                                                     javax.swing.GroupLayout.DEFAULT_SIZE,
    //                                                     javax.swing.GroupLayout.PREFERRED_SIZE)))
    //                             .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));

    //     pack();
    // }// </editor-fold>
    // /**
    //  * @param args the command line arguments
    //  */

    // // Variables declaration - do not modify//GEN-BEGIN:variables
    // // End of variables declaration//GEN-END:variables
}
