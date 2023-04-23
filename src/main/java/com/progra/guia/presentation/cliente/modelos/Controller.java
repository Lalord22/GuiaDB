/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.progra.guia.presentation.cliente.modelos;

import com.progra.guia.logic.Cliente;
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
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jennifer Lobo
 */
@WebServlet(name = "ModelosController", urlPatterns = {"/presentation/cliente/modelos/show","/ComprarPoliza"})
public class Controller extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
request.setAttribute("model", new Model());
        
        
        String viewUrl="";     
        switch (request.getServletPath()) {
          case "/presentation/cliente/modelos/show":
              viewUrl = this.show(request);
              break;
           case "/ComprarPoliza":
               this.paso1(request,response);
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

    private void paso1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // Retrieve form data
    String numeroPlaca = request.getParameter("numeroPlaca");
    String marca = request.getParameter("marca");
    String modelo = request.getParameter("modelo");
    int year = Integer.parseInt(request.getParameter("year"));
    double valorAsegurado = Double.parseDouble(request.getParameter("valorAsegurado"));
    String periodoPago = request.getParameter("periodoPago");
    LocalDate fechaInicio = LocalDate.parse(request.getParameter("fechaInicio"));
    
    // Do something with the data
    // ...

    // Forward to JSP
        request.getRequestDispatcher("CompraPaso2").forward(request, response);
        
    }

}
