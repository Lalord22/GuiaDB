/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.data;

import com.progra.guia.logic.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ESCINF
 */
public class UsuarioDao {
    RelDatabase db;

    public UsuarioDao(RelDatabase db){
        this.db= db;
    }
    
    public void addUser(String cedula, String clave, String tipo) throws Exception {
    String query = "INSERT INTO Usuario (cedula, clave, tipo) VALUES (?, ?, ?)";
    PreparedStatement statement = db.prepareStatement(query);
    statement.setString(1, cedula);
    statement.setString(2, clave);
    statement.setString(3, tipo);
    ResultSet rs = db.executeQuery(statement);
 
    
  }
    
    
    public Usuario read(String cedula) throws Exception {
        String sql = "select " +
                "* " +
                "from  Usuario e " +
                "where e.cedula=?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setString(1, cedula);
        ResultSet rs = db.executeQuery(stm);
        if (rs.next()) {
            return from(rs, "e");
        } else {
            throw new Exception("Empleado no Existe");
        }
    }
    
    public Usuario from(ResultSet rs, String alias) {
        try {
            Usuario e = new Usuario();
            e.setCedula(rs.getString(alias + ".cedula"));
            e.setClave(rs.getString(alias + ".clave"));
            e.setTipo(rs.getInt(alias + ".tipo"));            
            return e;
        } catch (SQLException ex) {
            return null;
        }
    }    
 }
