/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.data;

import com.progra.guia.logic.Cobertura;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Jennifer Lobo
 */
public class CoberturaDao {
    RelDatabase db;

    public CoberturaDao(RelDatabase db) {
        this.db = db;
    }
    public Cobertura read(Integer id) throws Exception {
        String sql = "select " +
                "* " +
                "from Cobertura e inner join Categoria u on e.categoria=u.id " +
                "where e.id=?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setInt(1, id);
        ResultSet rs = db.executeQuery(stm);
        CategoriaDao categoriaDao = new CategoriaDao(db);
        Cobertura c;
        if (rs.next()) {
            c= from(rs, "e");
            c.setCategoria(categoriaDao.from(rs,"u"));
            return c;
        } else {
            throw new Exception("Cobertura no Existe");
        }
    }
    
    public Cobertura from(ResultSet rs, String alias) {
        try {
            Cobertura e = new Cobertura();
            e.setId(rs.getInt(alias + ".id"));
            e.setDescripcion(rs.getString(alias + ".descripcion"));
            e.setCostoMinimo(rs.getDouble(alias+".costoMinimo"));
            e.setCostoPorcentual(rs.getDouble(alias + ".costoPorcentual"));
            return e;
        } catch (SQLException ex) {
            return null;
        }
    }    

    public void update(Cobertura e) throws Exception {
        String sql = "UPDATE Cobertura SET id=?, descripcion=?, costoMinimo=?, costoPorcentual=? WHERE id=?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setInt(1, e.getId());
        stm.setString(2, e.getDescripcion());
        stm.setDouble(3, e.getCostoMinimo());
        stm.setDouble(4, e.getCostoPorcentual());
       
        int count = db.executeUpdate(stm);
        if (count == 0) {
            throw new Exception("Cobertura no existe");
        }
    }    

    public void addCobertura(Cobertura u) throws Exception {
        String query = "INSERT INTO Cobertura (id, descripcion, costoMinimo, costoPorcentual, categoria) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement statement = db.prepareStatement(query);
        statement.setInt(1, u.getId());
        statement.setString(2, u.getDescripcion());
        statement.setDouble(3, u.getCostoMinimo());
        statement.setDouble(4, u.getCostoPorcentual());
        statement.setInt(5, u.getCategoria().getId());
        db.executeUpdate(statement); 

      }
}