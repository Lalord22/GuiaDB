/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.progra.guia.presentation.cliente.modelos;

import com.progra.guia.logic.Cliente;
import com.progra.guia.logic.Marca;
import com.progra.guia.logic.Modelo;
import com.progra.guia.logic.Service;
import com.progra.guia.logic.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jennifer Lobo
 */
@WebServlet(name = "ModelosController", urlPatterns = {"/presentation/cliente/modelos/show", 
    "/presentation/cliente/modelos/agregar"})
public class Controller extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
request.setAttribute("model", new Model());
        
        
        String viewUrl="";     
        switch (request.getServletPath()) {
          case "/presentation/cliente/modelos/show":
              viewUrl = this.show(request);
              break;
          case "/presentation/cliente/modelos/agregar":
              viewUrl = this.add(request);
              break;               
        }          
        request.getRequestDispatcher(viewUrl).forward( request, response); 
    }
    
    public String show(HttpServletRequest request) {
            return this.showAction(request);
        }
    
    public String showAction(HttpServletRequest request) {
        Model model = (Model) request.getAttribute("model");
        Service service = Service.instance();
        HttpSession session = request.getSession(true);
 
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        Cliente cliente;
        try {
            cliente = service.clienteFind(usuario);
        } catch (Exception ex) {
            cliente=null;
        }
        try {   
            List<Modelo> modelos= new ArrayList<>();
            Modelo modelo= new Modelo(0,"",null);
            
            model.setModelos(service.cargarModelos());
            
            return "/presentation/cliente/modelos/View.jsp";
        } catch (Exception ex) {
            return "";
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    public String add(HttpServletRequest request) {
        request.setAttribute("model", new Model());
        Service service = Service.instance();
 
        String modeloDescripcion = request.getParameter("modelo");
        String marcaDescripcion = request.getParameter("marca");

        Marca marca= new Marca(0, "");
        marca.setDescripcion(marcaDescripcion);
        
        Modelo modelo=new Modelo(0,modeloDescripcion, marca);
        try {
            service.agregarMarca(marca);
            service.agregarModelo(modelo);
            //return "/presentation/registration/registrationSuccess.jsp";
            return "/presentation/cliente/modelos/Agregar.jsp";
            
        } catch (Exception ex) {
            System.out.println("Error, try again later");
            return null;
        }
    }   
    
}