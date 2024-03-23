/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4;

/**
 *
 * @author jesus
 */
public class CadenaFiltros {
    private Objetivo objetivo;

    public CadenaFiltros() {
        this.objetivo = new Objetivo();
    }

    public void peticionFiltros() {
        System.out.println("Ejecutando filtros...");
    }

    public void ejecutar() {
        peticionFiltros();
        objetivo.ejecutar();
    }
}
