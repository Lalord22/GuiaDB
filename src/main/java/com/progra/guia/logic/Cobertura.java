/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.logic;

/**
 *
 * @author Jennifer Lobo
 */
public class Cobertura {
    Integer id;
    String descripcion;
    double costoMinimo;
    double costoPorcentual;
    Categoria categoria;

    public Cobertura() {}
    
    public Cobertura(Integer id, String descripcion, double costoMinimo, double costoPorcentual, Categoria categoria) {
        this.id = id;
        this.descripcion = descripcion;
        this.costoMinimo = costoMinimo;
        this.costoPorcentual = costoPorcentual;
        this.categoria = categoria;
    }


    
}
