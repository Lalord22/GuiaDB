/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.progra.guia.data;

/**
 *
 * @author lalo2
 */

import com.progra.guia.logic.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.progra.guia.logic.Usuario;

import com.progra.guia.logic.Usuario;

import java.sql.Connection;

import java.sql.Connection;

/**
 * Persistence class for Usuario objects.
 */
public class UsuarioPersistence {

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/guia";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    
    // SQL queries
    private static final String INSERT_USUARIO = "INSERT INTO usuario (username, password) VALUES (?, ?)";
    private static final String SELECT_USUARIO_BY_USERNAME = "SELECT * FROM usuario WHERE username = ?";
    private static final String SELECT_ALL_USUARIOS = "SELECT * FROM usuario";
    
    /**
     * Create a new Usuario in the data storage.
     * @param usuario The Usuario object to be persisted.
     */
    public void createUsuario(Usuario usuario) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            PreparedStatement stmt = conn.prepareStatement(INSERT_USUARIO);
            stmt.setString(1, usuario.getCedula());
            stmt.setString(2, usuario.getClave());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            // Handle exception
        }
    }

    /**
     * Retrieve a Usuario from the data storage by username.
     * @param username The username of the Usuario to retrieve.
     * @return The retrieved Usuario object, or null if not found.
     */
    public Usuario getUsuarioByUsername(String username) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            PreparedStatement stmt = conn.prepareStatement(SELECT_USUARIO_BY_USERNAME);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String password = rs.getString("password");
                return new Usuario(username, password);
            }
        } catch (SQLException ex) {
            // Handle exception
        }
        return null;
    }

    /**
     * Retrieve a list of all Usuarios from the data storage.
     * @return A list of Usuario objects.
     */
    public List<Usuario> getAllUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            PreparedStatement stmt = conn.prepareStatement(SELECT_ALL_USUARIOS);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                usuarios.add(new Usuario(username, password));
            }
        } catch (SQLException ex) {
            // Handle exception
        }
        return usuarios;
    }
}

