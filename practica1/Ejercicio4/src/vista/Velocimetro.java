/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package vista;

/**
 *
 * @author carme
 */
public class Velocimetro extends javax.swing.JPanel {
    Salpicadero salpicadero;
    private javax.swing.JLabel velocimetro;
    private javax.swing.JLabel nombre;
    /**
     * Creates new form Velocimetro
     */
    public Velocimetro(Salpicadero s) {
        this.salpicadero = s;
        initComponents();
    }
    
        
    public void update()
    {
        velocimetro.setText(String.format("%.2f", salpicadero.getObjetivo().getVelocidad()));
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        velocimetro = new javax.swing.JLabel();

        nombre = new javax.swing.JLabel();
        nombre.setText("Velocímetro");

        velocimetro.setText(String.format("%.2f", salpicadero.getObjetivo().getVelocidad()));
        velocimetro.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(nombre)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addComponent(velocimetro, javax.swing.GroupLayout.PREFERRED_SIZE, 229, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(82, 82, 82))
                
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(60, 60, 60)
                .addComponent(nombre)
                .addGap(18, 18, 18)
                .addComponent(velocimetro, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(60, Short.MAX_VALUE))
                
        );
    }// </editor-fold>//GEN-END:initComponents

    public void actualizar (){
        velocimetro.setText(String.format("%.2f", salpicadero.getObjetivo().getVelocidad()));
    }
}
