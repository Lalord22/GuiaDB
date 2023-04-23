/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.data;


import com.progra.guia.logic.Marca;
import com.progra.guia.logic.Modelo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Daniela Madrigal
 */
public class ModeloDao {
    RelDatabase db;

    public ModeloDao(RelDatabase db){
        this.db= db;
    }  

    
    public Modelo read(Integer id) throws Exception {
        String sql = "select " +
                "* " +
                "from Modelo e inner join Marca u on e.id=u.id " +
                "where e.id=?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setInt(1, id);
        ResultSet rs = db.executeQuery(stm);
        MarcaDao marcaDao = new MarcaDao(db);
        Modelo c;
        if (rs.next()) {
            c= from(rs, "e");
            c.setMarca(marcaDao.from(rs,"u"));
            return c;
        } else {
            throw new Exception("Cliente no Existe");
        }
    }
    
    public Modelo from(ResultSet rs, String alias) {
        try {
            Modelo e = new Modelo(0,"",new Marca(0,""));
            e.setId(rs.getInt(alias + ".id"));
            e.setDescripcion(rs.getString(alias + ".descripcion"));
        
            return e;
        } catch (SQLException ex) {
            return null;
        }
    }    

    public void update(Modelo e) throws Exception {
        String sql = "UPDATE Modelo SET descripcion=? WHERE id=?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setString(1, e.getDescripcion());
        int count = db.executeUpdate(stm);
        if (count == 0) {
            throw new Exception("Modelo no existe");
        }
    }    

    public void addModelo(Modelo u) throws Exception {
        String query = "INSERT INTO Modelo (descripcion, marca) VALUES (?, ?)";
        PreparedStatement statement = db.prepareStatement(query);
        statement.setString(1, u.getDescripcion());
        statement.setInt(2, u.getMarca().getId());
        db.executeUpdate(statement); 

      }

    public Modelo from(ResultSet rs) {
            try {
                Marca marca= new Marca(0, "");
                
                
                
                Modelo modelo = new Modelo(0, "", marca);
                modelo.setId(rs.getInt("id"));
                modelo.setDescripcion(rs.getString( "descripcion"));
                modelo.setMarca(marca);
                return modelo;
            } catch (SQLException ex) {
                return null;
            }
        }

    public List<Modelo> cargarTodo() { 
        List<Modelo> resultado = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Modelo";
            PreparedStatement stm = db.prepareStatement(sql);
            ResultSet rs = db.executeQuery(stm);
            while (rs.next()) {
                resultado.add(from(rs));
            }
        } catch (SQLException ex) {
            // Handle the exception
        }
        return resultado;


        }
}
