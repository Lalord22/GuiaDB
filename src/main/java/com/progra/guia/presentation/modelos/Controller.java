/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.progra.guia.presentation.modelos;

import com.progra.guia.logic.Cliente;
import com.progra.guia.logic.Marca;
import com.progra.guia.logic.Modelo;
import com.progra.guia.logic.Service;
import com.progra.guia.logic.Usuario;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
/*
 * @author Jennifer Lobo
 */
@WebServlet(name = "ControllerModelos", urlPatterns = {
    "/presentation/cliente/modelos",
    "/presentation/admin/agregaModelo"})
public class Controller extends HttpServlet {
     
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        request.setAttribute("model", new Model());
        String viewUrl = "";

       switch (request.getServletPath()) {
            case "/presentation/cliente/modelos":
                viewUrl = this.show(request);
                break;
            case "/presentation/admin/agregaModelo":
                viewUrl = this.agregarModelo(request);
                break;

        }

        request.getRequestDispatcher(viewUrl).forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public static final String LOCATION = "D:/images/";
   
    private void postImage(HttpServletRequest request, Integer id){
        File folder = new File(LOCATION);
        if (!folder.exists()) {
            folder.mkdirs();
        }
         try{
            final Part imagen = request.getPart("imagen");
            String contentType = imagen.getContentType();
            String extension = "";
            if(contentType.equals("image/jpeg")){
                extension = ".jpg";
            }else if(contentType.equals("image/png")){
                extension = ".png";
            }else{
                throw new Exception("Tipo de archivo no soportado");
            }
            InputStream is = imagen.getInputStream();
            FileOutputStream os = new FileOutputStream(LOCATION + id + extension);
            is.transferTo(os);
            os.close();
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }
    
    private void getImage(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("id");
         try{
            ServletOutputStream os = response.getOutputStream();
            String extension = ".jpg";
            FileInputStream is = new FileInputStream(LOCATION + id + extension);
            is.transferTo(os);
            os.close();
        }catch(IOException ex){
            
        }
    }
    
     
    private String show(HttpServletRequest request) {
        return this.showAction(request);
    }

    private String showAction(HttpServletRequest request) {
        Model model = (Model) request.getAttribute("model");
        Service service = Service.instance();
        HttpSession session = request.getSession(true);

        Usuario usuario = (Usuario) session.getAttribute("usuario");

        model.setModelos(service.cargarModelos());
        return "/presentation/cliente/modelos/View.jsp";

    }
    private String getImageAction(HttpServletRequest request, HttpServletResponse response) {
        
        String id = request.getParameter("id");
        System.out.println("ID parameter: " + id);

        // Llama a la función getImage pasando los objetos request y response
        getImage(request, response);

        // Retorna una cadena de texto vacía porque la función getImage no retorna nada
        return "";
    }
    
    private String agregarModelo(HttpServletRequest request) throws Exception {
        request.setAttribute("model", new Model());
        Service service = Service.instance();

        String descripcion = request.getParameter("descripcion");
        String id = request.getParameter("marca");
        Integer idValue = Integer.parseInt(id);

        Marca marca = service.cargarMarcaById(idValue);

        Modelo modelo = new Modelo(0, "",null);
        modelo.setDescripcion(descripcion);
        modelo.setMarca(marca);

        try {
            service.agregarModelo(modelo);

            postImage(request, modelo.getId());
            String imagen = request.getParameter("imagen");
            System.out.println("Imagen parameter: " + imagen);

            return "/presentation/cliente/modelos";
        } catch (Exception ex) {
            System.out.println("Error, try again later");
            return null;
        }

    }
}
    
