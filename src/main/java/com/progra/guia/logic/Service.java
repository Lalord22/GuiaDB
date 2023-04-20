/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.progra.guia.logic;

import com.progra.guia.data.ClienteDao;
import com.progra.guia.data.CoberturaDao;
import com.progra.guia.data.PolizaDao;
import com.progra.guia.data.RelDatabase;
import com.progra.guia.data.UsuarioDao;
import java.util.List;

/**
 *
 * @author Escinf
 */
public class Service {
    private static Service uniqueInstance;
    
    public static Service instance(){
        if (uniqueInstance == null){
            uniqueInstance = new Service();
        }
        return uniqueInstance; 
    }
    RelDatabase relDatabase;
    UsuarioDao usuarioDao;
    ClienteDao clienteDao;
    PolizaDao polizaDao;
    CoberturaDao coberturaDao;
    
//    HashMap<String,Usuario> usuarios;
//    HashMap<String,Cliente> clientes;
//    HashMap<String,Cuenta> cuentas;
//    HashMap<String,List<String>> favoritas;
    
    
    private Service(){
        relDatabase = new RelDatabase();
        usuarioDao = new UsuarioDao(relDatabase);
        clienteDao = new ClienteDao(relDatabase);
        polizaDao = new PolizaDao(relDatabase);
        coberturaDao = new CoberturaDao(relDatabase);
        
    }

    public Usuario usuarioFind(String cedula,String clave) throws Exception{
        return usuarioDao.read(cedula);
        // Falta verificar clave
    }

    public Cliente clienteFind(Usuario usuario) throws Exception{
        return clienteDao.read(usuario.getCedula());
    }
    
    public List<Poliza> polizaFind(Cliente cliente) throws Exception{
        List<Poliza> polizas = polizaDao.findByCliente(cliente);
        for(Poliza e:polizas) e.setCliente(cliente);
        cliente.setPolizas(polizas);
        return polizas;
    }

    public void clienteUpdate(Cliente cliente) throws Exception{
        clienteDao.update(cliente);
    }
    
     public void usuarioUpdate(Usuario usuario) throws Exception{
        usuarioDao.update(usuario);
    }
    
     //MODIFIQUE ESTE METODO
    public List<Poliza> polizaFindPlaca(String numero) throws Exception{
        return polizaDao.findByPlaca(numero);
    }   
    
    public void registerUser(Usuario u)throws Exception{
         usuarioDao.addUser(u);
    }
    
    public void registerClient(Cliente u)throws Exception{
         clienteDao.addClient(u);
    }

    public Poliza polizaShowById(Integer parameter) throws Exception {
        
        return polizaDao.read(parameter);
        
    }
    
    public List<Cobertura> cargarCoberturas(){
            return coberturaDao.cargarTodo();
    }
    
    
    
    

    
}
