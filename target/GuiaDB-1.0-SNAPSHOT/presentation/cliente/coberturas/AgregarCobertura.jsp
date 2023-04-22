<%-- 
    Document   : AgregarCobertura
    Created on : Apr 21, 2023, 3:59:56 PM
    Author     : lalo2
--%>
<%@page import="com.progra.guia.presentation.categorias.Model"%>
<%@page import="com.progra.guia.logic.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Model model = (Model) request.getAttribute("model");
    List<Categoria> categoriasList = model.getCategorias();
    
%>
<!DOCTYPE html>
<html>
    <head>
         <%@ include file="/presentation/Head.jsp" %>
        <title>Agregar Cobertura</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Agregar Cobertura</h1>
        <form action="presentation/cliente/agregacobertura" method="POST">
            <label for="descripcion">Descripcion:</label>
            <input type="text" id="descripcion" name="descripcion" required><br><br>
            <label for="descripcion">Costo Minimo:</label>
            <input type="text" id="minimo" name="minimo" required><br><br>
            <label for="descripcion">Costo Porcentual:</label>
            <input type="text" id="porcentual" name="porcentual" required><br><br>
            <label for="categoria">Categoría:</label>
            <select id="categoria" name="categoria">
                <% 
                // Retrieve list of categories from the database
                
                 for(Categoria categoria : categoriasList) {
                    %>
                    <option value="<%= categoria.getId() %>"><%= categoria.getDescripcion() %></option>
                    <%
                }
                %>
            </select><br><br>
            
            <button type="submit">Agregar Cobertura</button>
        </form>
         <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>
