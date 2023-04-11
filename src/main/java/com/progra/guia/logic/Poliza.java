/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.progra.guia.logic;

import java.util.Objects;

/**
 *
 * @author Escinf
 */
public class Poliza {
    String numeroPlaca;
    String marcaModelo;
    String anno;
    double valorAsegurado;
    String plazoPago;
    String fechaInicio;
    Integer cobertura;
    Cliente cliente;
    
      public Poliza(String numeroPlaca, String marcaModelo, String anno, double valorAsegurado, String plazoPago, String fechaInicio, Integer cobertura, Cliente cliente) {
        this.numeroPlaca = numeroPlaca;
        this.marcaModelo = marcaModelo;
        this.anno = anno;
        this.valorAsegurado = valorAsegurado;
        this.plazoPago = plazoPago;
        this.fechaInicio = fechaInicio;
        this.cobertura = cobertura;
        this.cliente = cliente;
    }

     public Poliza() {
        this("","","",0,"","",0,new Cliente());
    }


    public String getNumeroPlaca() {
        return numeroPlaca;
    }

    public void setNumeroPlaca(String numeroPlaca) {
        this.numeroPlaca = numeroPlaca;
    }

    public String getMarcaModelo() {
        return marcaModelo;
    }

    public void setMarcaModelo(String marcaModelo) {
        this.marcaModelo = marcaModelo;
    }

    public String getAnno() {
        return anno;
    }

    public void setAnno(String anno) {
        this.anno = anno;
    }

    public double getValorAsegurado() {
        return valorAsegurado;
    }

    public void setValorAsegurado(double valorAsegurado) {
        this.valorAsegurado = valorAsegurado;
    }

    public String getPlazoPago() {
        return plazoPago;
    }

    public void setPlazoPago(String plazoPago) {
        this.plazoPago = plazoPago;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Integer getCobertura() {
        return cobertura;
    }

    public void setCobertura(Integer cobertura) {
        this.cobertura = cobertura;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Poliza other = (Poliza) obj;
        if (!Objects.equals(this.numeroPlaca, other.numeroPlaca)) {
            return false;
        }
        return true;
    }
    
    
    
    
}
