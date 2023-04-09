// Example code for user registration service
package com.progra.guia.registration;

import com.progra.guia.logic.Usuario;

public class RegistrationService {

    public void registerUser(String username, String password, int role) {
        // Create a new instance of Usuario with the provided information
        Usuario nuevoUsuario = new Usuario(username, password, role);

        // Perform any necessary validation or business logic

        // Persist the new user to the database or other data storage mechanism
        // ...

        // Return any relevant result or status
        // ...
    }

}

