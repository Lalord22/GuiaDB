/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.progra.guia.presentation.coberturas;

import com.progra.guia.logic.Categoria;
import com.progra.guia.logic.Cliente;
import com.progra.guia.logic.Cobertura;
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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lalo2
 */
@WebServlet(name = "ControllerCobertura", urlPatterns = {
    "/presentation/cliente/coberturas",
    "/presentation/admin/agregaCobertura",
    "/deleteCobertura"})
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("model", new Model());
        String viewUrl = "";

        switch (request.getServletPath()) {
            case "/presentation/cliente/coberturas":
                viewUrl = this.show(request);
                break;
            case "/presentation/admin/agregaCobertura":
                viewUrl = this.agregarCobertura(request);
                break;
            case "/deleteCobertura":
                viewUrl = this.delete(request);
                break;

        }

        request.getRequestDispatcher(viewUrl).forward(request, response);

    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String show(HttpServletRequest request) {
        return this.showAction(request);
    }

    private String showAction(HttpServletRequest request) {
        Model model = (Model) request.getAttribute("model");
        Service service = Service.instance();
        HttpSession session = request.getSession(true);

        Usuario usuario = (Usuario) session.getAttribute("usuario");

        model.setCoberturas(service.cargarCoberturas());
        return "/presentation/cliente/coberturas/View.jsp";

    }

    private String agregarCobertura(HttpServletRequest request) throws Exception {

        request.setAttribute("model", new Model());
        Service service = Service.instance();

        String descripcion = request.getParameter("descripcion");
        String minimo = request.getParameter("minimo");
        String porcentual = request.getParameter("porcentual");
        String id = request.getParameter("categoria");

        double min = Double.parseDouble(minimo);
        double prcnt = Double.parseDouble(porcentual);
        Integer idValue = Integer.parseInt(id);

        Categoria cat = service.cargarCategoriaById(idValue);

        Cobertura cobertura = new Cobertura(0, descripcion, min, prcnt, cat);

        try {

            service.agregaCobertura(cobertura);

            return "/presentation/cliente/coberturas";

        } catch (Exception ex) {

            System.out.println("Error, try again later");

            return null;
        }

    }

    private String delete(HttpServletRequest request) {
        request.setAttribute("model", new Model());
        Service service = Service.instance();
        String id = request.getParameter("id");
        
        try {

            service.deleteCobertura(id);

            return "/presentation/registration/registrationSuccess.jsp";

        } catch (Exception ex) {

            System.out.println("Error, try again later");

            return null;
        }
    }

}
