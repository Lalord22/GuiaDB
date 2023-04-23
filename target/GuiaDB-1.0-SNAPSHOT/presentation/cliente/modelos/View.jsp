<%-- 
    Document   : View
    Created on : 21 abr. 2023, 16:45:03
    Author     : Jennifer Lobo
--%>

<%-- --%>
<%@page import="com.progra.guia.presentation.modelos.Model"%>
<%@page import="com.progra.guia.logic.Modelo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    Model model = (Model) request.getAttribute("model");
    List<Modelo> modeloList = model.getModelos();
    
%>


<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="/presentation/Head.jsp" %>

        <title>Administrator Page</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Lista de modelos</h1>

        <table>
            <tr>
                <th>ID</th>
                <th>Description</th>
          
            </tr>

            <%-- Iterate over the list of coberturas and display them --%>
            <% for(Modelo modelos : modeloList) { %>
            <tr>
                <td><%=modelos.getId()%></td>
                <td><%=modelos.getDescripcion()%></td>
        
            </tr>
            <% } %>
        </table>

        <a href="presentation/cliente/agregamodelo">Agregar Modelo</a>
        
        
        <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>
