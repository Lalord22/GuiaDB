<%-- 
    Document   : View
    Created on : Apr 21, 2023, 4:21:00 PM
    Author     : lalo2
--%>

<%@page import="com.progra.guia.presentation.categorias.Model"%>
<%@page import="com.progra.guia.logic.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    Model model = (Model) request.getAttribute("model");
    List<Categoria> categoriasList = model.getCategorias();
    
%>


<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="/presentation/Head.jsp" %>

        <title>Administrator Page</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>List of Categorias</h1>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Actions</th>
            </tr>


            <% for(Categoria categoria : categoriasList) { %>
            <tr>
                <td><%=categoria.getId()%></td>
                <td><%=categoria.getDescripcion()%></td>
                <td>
                    <a href="editCobertura.jsp?id=<%=categoria.getId()%>">Edit</a>
                    <a href="deleteCobertura.jsp?id=<%=categoria.getId()%>">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>

        <a href="presentation/cliente/coberturas/AgregarCategoria.jsp">Add new categoria</a>
        
        
        <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>
