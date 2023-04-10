/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.data;

import com.progra.guia.logic.Cliente;
import com.progra.guia.logic.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ESCINF
 */
public class ClienteDao {
    RelDatabase db;

    public ClienteDao(RelDatabase db){
        this.db= db;
    }    
    
    public Cliente read(String cedula) throws Exception {
        String sql = "select " +
                "* " +
                "from Cliente e inner join Usuario u on e.usuario=u.cedula " +
                "where e.cedula=?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setString(1, cedula);
        ResultSet rs = db.executeQuery(stm);
        UsuarioDao usuarioDao = new UsuarioDao(db);
        Cliente c;
        if (rs.next()) {
            c= from(rs, "e");
            c.setUsuario(usuarioDao.from(rs,"u"));
            return c;
        } else {
            throw new Exception("Cliente no Existe");
        }
    }
    
    public Cliente from(ResultSet rs, String alias) {
        try {
            Cliente e = new Cliente();
            e.setCedula(rs.getString(alias + ".cedula"));
            e.setNombre(rs.getString(alias + ".nombre"));
            e.setTelefono(rs.getString(alias+".telefono"));
            e.setCorreo(rs.getString(alias + ".correo"));
            e.setDatosTarjeta(rs.getString(alias+".datosTarjeta"));
            return e;
        } catch (SQLException ex) {
            return null;
        }
    }    

    public void update(Cliente e) throws Exception {
        String sql = "update " +
                "Cliente " +
                "set nombre=? , telefono=?, correo=?, datosTarjeta=?" +
                "where cedula=?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setString(1, e.getNombre());
        stm.setString(2, e.getCedula());
        int count = db.executeUpdate(stm);
        if (count == 0) {
            throw new Exception("Cliente no existe");
        }
    }    

    public void addClient(Cliente u) throws Exception {
        String query = "INSERT INTO cliente (cedula, nombre,telefono, correo, datosTarjeta, usuario) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = db.prepareStatement(query);
        statement.setString(1, u.getCedula());
        statement.setString(2, u.getNombre());
        statement.setString(3, u.getTelefono());
        statement.setString(4, u.getCorreo());
        statement.setString(5, u.getDatosTarjeta());
        statement.setString(6, u.getUsuario().getCedula());
        db.executeUpdate(statement); 

      }
}
