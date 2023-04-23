<%-- 
    Document   : View
    Created on : 23 abr. 2023, 00:36:55
    Author     : Daniela Madrigal
--%>
<%@page import="com.progra.guia.presentation.marcas.Model"%>
<%@page import="com.progra.guia.logic.Marca"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    Model model = (Model) request.getAttribute("model");
    List<Marca> marcaList = model.getMarcas();
    
%>


<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="/presentation/Head.jsp" %>

        <title>Administrator Page</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Lista de Marcas</h1>

        <table>
            <tr>
                <th>ID</th>
                <th>Descripcion</th>
            </tr>


            <% for(Marca marcas : marcaList) { %>
            <tr>
                <td><%=marcas.getId()%></td>
                <td><%=marcas.getDescripcion()%></td>
                <td>
                </td>
            </tr>
            <% } %>
        </table>

        <a href="presentation/admin/marcas/AgregarMarca.jsp">Agregar nueva Marca</a>
        
        
        <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>