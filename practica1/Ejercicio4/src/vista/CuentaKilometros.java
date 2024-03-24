/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package vista;

/**
 *
 * @author carme
 */
public class CuentaKilometros extends javax.swing.JPanel {
    Salpicadero salpicadero;
    private javax.swing.JLabel contadorReciente;
    private javax.swing.JLabel contadorTotal;
    private javax.swing.JLabel nombreReciente;
    private javax.swing.JLabel nombreTotal;
    private javax.swing.JLabel nombre;
    /**
     * Creates new form CuentaKilometros
     */
    public CuentaKilometros(Salpicadero s) {
        this.salpicadero = s;
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        contadorReciente = new javax.swing.JLabel();
        contadorTotal = new javax.swing.JLabel();

        nombre = new javax.swing.JLabel();
        nombre.setText("CuentaKilómetros");

        nombreTotal = new javax.swing.JLabel();
        nombreTotal.setText("Total:");
        nombreReciente = new javax.swing.JLabel();
        nombreReciente.setText("Reciente:");

        contadorReciente.setText(String.format("%.4f", salpicadero.getObjetivo().getDistancia()));
        contadorReciente.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        contadorTotal.setText(String.format("%.4f", salpicadero.getObjetivo().getDistanciaTotal()));
        contadorTotal.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setAutoCreateGaps(true);
        layout.setAutoCreateContainerGaps(true);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(82, 82, 82)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                .addComponent(nombre)
                .addComponent(nombreTotal)
                .addComponent(contadorTotal, javax.swing.GroupLayout.PREFERRED_SIZE, 229, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addComponent(nombreReciente)
                .addComponent(contadorReciente, javax.swing.GroupLayout.PREFERRED_SIZE, 229, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(82, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(nombre)
                .addGap(18, 18, 18)
                .addComponent(nombreReciente)
                .addGap(18, 18, 18)
                .addComponent(contadorReciente, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addComponent(nombreTotal)
                .addGap(18, 18, 18)
                .addComponent(contadorTotal, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18))
        );
    }// </editor-fold>//GEN-END:initComponents

    public void actualizar(){
        contadorReciente.setText(String.format("%.4f", salpicadero.getObjetivo().getDistancia()));
        contadorTotal.setText(String.format("%.4f", salpicadero.getObjetivo().getDistanciaTotal()));
    }
}
