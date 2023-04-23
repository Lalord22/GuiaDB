<%-- 
    Document   : AgregarModelo
    Created on : 22 abr. 2023, 20:17:34
    Author     : Jennifer Lobo
--%>

<%@page import="com.progra.guia.presentation.marcas.Model"%>
<%@page import="com.progra.guia.logic.Marca"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Model model = (Model) request.getAttribute("model");
    List<Marca> marcasList = model.getMarcas();
    
%>
<!DOCTYPE html>
<html>
    <head>
         <%@ include file="/presentation/Head.jsp" %>
        <title>Agregar Modelo</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Agregar Cobertura</h1>
        <form action="presentation/admin/agregaModelo" method="POST">
            <label for="descripcion">Descripcion:</label>
            <input type="text" id="descripcion" name="descripcion" required><br><br>
            
            <label for="marca">Marca:</label>
            <select id="marca" name="marca">
                <% 
                // Retrieve list of categories from the database
                
                 for(Marca marca: marcasList) {
                    %>
                    <option value="<%= marca.getId() %>"><%= marca.getDescripcion() %></option>
                    <%
                }
                %>
            </select><br><br>
            
            <button type="submit">Agregar Modelo</button>
        </form>
         <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>

