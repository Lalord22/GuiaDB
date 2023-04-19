/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.data;

import com.progra.guia.logic.Cliente;
import com.progra.guia.logic.Marca;
import com.progra.guia.logic.Modelo;
import com.progra.guia.logic.Poliza;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *Modifique esta clase
 * @author ESCINF
 */
public class PolizaDao {
    RelDatabase db;

    public PolizaDao(RelDatabase db){
        this.db= db;
    }
    public Poliza read(Integer id) throws Exception {
        String sql = "select * from Poliza e inner join Cliente c on e.cliente = c.cedula inner join Modelo m on e.modelo = m.id where e.id = ?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setInt(1, id);
        ResultSet rs = db.executeQuery(stm);
        ClienteDao clienteDao = new ClienteDao(db);
        ModeloDao modeloDao = new ModeloDao(db);
        Poliza c;
        if (rs.next()) {
            c = from(rs);
            c.setCliente(clienteDao.from(rs, "c"));
            c.setModelo(modeloDao.from(rs,"m"));
            return c;
        } else {
            throw new Exception("Poliza no Existe");
        }
    }

    public List<Poliza> findByCliente(Cliente cliente) {
    List<Poliza> resultado = new ArrayList<>();
    try {
        String sql = "SELECT * FROM Poliza WHERE cliente = ?";
        PreparedStatement stm = db.prepareStatement(sql);
        stm.setString(1, cliente.getCedula());
        ResultSet rs = db.executeQuery(stm);
        while (rs.next()) {
            resultado.add(from(rs));
        }
    } catch (SQLException ex) {
        // Handle the exception
    }
    return resultado;
}
    
    public List<Poliza> findByPlaca(String placa) {
    List<Poliza> resultado = new ArrayList<>();
    try {
        String sql = "SELECT * FROM Poliza WHERE numeroPlaca = ?";
        if (placa != null && !placa.isEmpty()) {
            sql = "SELECT * FROM Poliza WHERE numeroPlaca = '" + placa + "'";
        }
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



    
       public List<Poliza> findByModelo(Modelo modelo) {
        List<Poliza> resultado = new ArrayList<>();
        try {
            String sql = "select * " +
                    "from " +
                    "Poliza e " +
                    "where e.modelo=?";
            PreparedStatement stm = db.prepareStatement(sql);
            stm.setInt(1, modelo.getId());
            ResultSet rs = db.executeQuery(stm);
            while (rs.next()) {
                resultado.add(from(rs));
            }
        } catch (SQLException ex) {
        }
        return resultado;
    }
    
      private Poliza from(ResultSet rs) throws SQLException {
    Poliza poliza = new Poliza();
    poliza.setId(rs.getInt("id"));
    poliza.setNumeroPlaca(rs.getString("numeroPlaca"));
    poliza.setAnno(rs.getString("anno"));
    poliza.setValorAsegurado(rs.getDouble("valorAsegurado"));
    poliza.setPlazoPago(rs.getString("plazoPago"));
    poliza.setFechaInicio(rs.getString("fechaInicio"));
    Modelo modeloCarro = new Modelo(0,"",new Marca(0,""));
    modeloCarro.setId(rs.getInt("modelo"));
    poliza.setModelo(modeloCarro);
    return poliza;
}

    
}
