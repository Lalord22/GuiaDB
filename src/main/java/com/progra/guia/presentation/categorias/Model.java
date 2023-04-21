/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.presentation.categorias;

import com.progra.guia.logic.Categoria;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lalo2
 */
public class Model {
    List<Categoria> categoria;
    Categoria seleccionado;

    public Model() {
        this.reset();
    }

    public void reset(){ 
        List<Categoria> rows = new ArrayList<>();        
        seleccionado=null;  
        this.setCoberturas(rows);
    }
    
    public void setCoberturas(List<Categoria> categorias){
        this.categoria = categorias;    
    }

     public List<Categoria> getCoberturas() {
        return categoria;
    }

    public Categoria getSeleccionado() {
        return seleccionado;
    }

    public void setSeleccionado(Categoria seleccionado) {
        this.seleccionado = seleccionado;
    }
}
