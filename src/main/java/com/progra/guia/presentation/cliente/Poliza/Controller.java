/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.progra.guia.presentation.cliente.Poliza;

import com.progra.guia.logic.Cobertura;
import com.progra.guia.logic.Marca;
import com.progra.guia.logic.Modelo;
import com.progra.guia.logic.Poliza;
import com.progra.guia.logic.Service;
import com.progra.guia.logic.Usuario;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@WebServlet(name = "ClientePolizaController", urlPatterns = {"/presentation/cliente/poliza/show"})
public class Controller extends HttpServlet {
    
  protected void processRequest(HttpServletRequest request, 
                                HttpServletResponse response)
         throws ServletException, IOException {
           
        request.setAttribute("model", new Model());
        
        String viewUrl="";     
        switch (request.getServletPath()) {
          case "/presentation/cliente/poliza/show":
              viewUrl = this.show(request);
              break;
              
        }          
        request.getRequestDispatcher(viewUrl).forward( request, response); 
  }

    public String show(HttpServletRequest request) {
        try{
            Map<String,String> errores =  this.validar(request);
            if(errores.isEmpty()){
                this.updateModel(request);          
                return this.showAction(request);
            }
            else{
                request.setAttribute("errores", errores);
                return "/presentation/cliente/datos/View.jsp"; 
            }            
        }
        catch(Exception e){
            return "/presentation/Error.jsp";             
        }   
    }

    Map<String,String> validar(HttpServletRequest request){
        Map<String,String> errores = new HashMap<>();
        if (request.getParameter("numeroFld").isEmpty()){
            errores.put("numeroFld","Poliza requerida");
        }
        return errores;
    }
    
    void updateModel(HttpServletRequest request){
       Model model= (Model) request.getAttribute("model");
       
        model.getCurrent().setNumeroPlaca(request.getParameter("numeroFld"));
   }    
    
    public String showAction(HttpServletRequest request) {
    Model model = (Model) request.getAttribute("model");
    Service service = Service.instance();
    HttpSession session = request.getSession(true);
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    Integer idPoliza = Integer.parseInt(request.getParameter("numeroFld"));
    try {
        Poliza poliza = service.polizaShowById(idPoliza);
        if (poliza == null || !poliza.getCliente().getCedula().equals(usuario.getCedula())) {
            throw new Exception("Poliza no pertenece al cliente");
        }
        model.setCurrent(poliza);
        return "/presentation/cliente/poliza/View.jsp";
    } catch (Exception ex) {
        return "/presentation/Error.jsp";
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

   
    
}