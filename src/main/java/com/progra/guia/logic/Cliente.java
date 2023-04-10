/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.progra.guia.logic;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author Escinf
 */
public class Cliente {
    String cedula;
    String nombre;
<<<<<<< HEAD
=======
    String telefono;
    String correo;
    String datosTarjeta;
>>>>>>> 3e6ba5ec751f76a5570652d561b1ac7ec0dd36cf
    Usuario usuario;
    List<Cuenta> cuentas;

    public Cliente() {
<<<<<<< HEAD
        this("","",new Usuario());
    }

    public Cliente(String cedula, String nombre, Usuario usuario) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.usuario = usuario;
=======
        this("","","","","",new Usuario());
    }

    public Cliente(String cedula, String nombre, String telefono, String correo, String datosTarjeta, Usuario usuario) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.usuario = usuario;
        this.telefono = telefono;
        this.correo = correo;
        this.datosTarjeta = datosTarjeta;
>>>>>>> 3e6ba5ec751f76a5570652d561b1ac7ec0dd36cf
        this.cuentas = new ArrayList();
    }

    
    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public List<Cuenta> getCuentas() {
        return cuentas;
    }

    public void setCuentas(List<Cuenta> cuentas) {
        this.cuentas = cuentas;
    }

<<<<<<< HEAD
=======
    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDatosTarjeta() {
        return datosTarjeta;
    }

    public void setDatosTarjeta(String datosTarjeta) {
        this.datosTarjeta = datosTarjeta;
    }

>>>>>>> 3e6ba5ec751f76a5570652d561b1ac7ec0dd36cf
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
        final Cliente other = (Cliente) obj;
        if (!Objects.equals(this.cedula, other.cedula)) {
            return false;
        }
        return true;
    }

    
}
