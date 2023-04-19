/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.data;

import com.progra.guia.logic.Cliente;
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
            c = from(rs, "e");
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
            String sql = "select * " +
                    "from " +
                    "Poliza e " +
                    "where e.cliente=?";
            PreparedStatement stm = db.prepareStatement(sql);
            stm.setString(1, cliente.getCedula());
            ResultSet rs = db.executeQuery(stm);
            while (rs.next()) {
                resultado.add(from(rs, "e"));
            }
        } catch (SQLException ex) {
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
                resultado.add(from(rs, "e"));
            }
        } catch (SQLException ex) {
        }
        return resultado;
    }
    
    private Poliza from(ResultSet rs, String alias) {
        try {
            Poliza e = new Poliza();
           e.setId(rs.getInt(alias+".id"));
           e.setNumeroPlaca(rs.getString(alias+".numeroPlaca"));
           e.setAnno(rs.getString(alias+".anno"));
           e.setValorAsegurado(rs.getDouble(alias+".valorAsegurado"));
           e.setPlazoPago(rs.getString(alias+".plazoPago"));
           e.setFechaInicio(rs.getString(alias+".fechaInicio"));
            return e;
        } catch (SQLException ex) {
            return null;
        }
    }     
}
