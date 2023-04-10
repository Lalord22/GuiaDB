package com.progra.guia.registration;

import com.progra.guia.data.UsuarioPersistence;
import com.progra.guia.logic.Service;
import com.progra.guia.logic.Usuario;
import com.progra.guia.presentation.login.Model;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RegistrationController", urlPatterns = {"/presentation/login/register"})
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setAttribute("model", new Model());
        Service service = Service.instance();
        // Retrieve user input from registration form
        String username = request.getParameter("id");
        String password = request.getParameter("password");
        
        // Create a new Usuario object
        Usuario usuario = new Usuario();
        usuario.setCedula(username);
        usuario.setClave(password);
        usuario.setTipo(1);
        
   
        
        // Set response content type
        response.setContentType("text/html;charset=UTF-8");
        try {
            service.registerUser(usuario);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Registration Success</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Registration Successful</h1>");
            out.println("<p>Username: " + username + "</p>");
            out.println("<p>Password: " + password + "</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    
     
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}