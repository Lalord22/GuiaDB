/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.logic;

/**
 *
 * @author Daniela Madrigal
 */
public class Marca {
    Integer id;
    String descripcion;

    public Marca(Integer id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
    }
   
    public Marca() {
        this(0,"");
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
 
}
