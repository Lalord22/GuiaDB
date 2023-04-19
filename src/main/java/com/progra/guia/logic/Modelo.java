/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.logic;

/**
 *
 * @author Jennifer Lobo
 * 
 * Modifique esta clase (Daniela)
 */ 
public class Modelo {
    Integer id;
    String descripcion;
    Marca marca;

    public Modelo(Integer id, String descripcion, Marca marca) {
        this.id = id;
        this.descripcion = descripcion;
        this.marca = marca;
    }

    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }
}
