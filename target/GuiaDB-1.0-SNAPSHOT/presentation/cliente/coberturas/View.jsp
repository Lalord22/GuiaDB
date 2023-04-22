<%-- 
    Document   : View
    Created on : 20 abr. 2023, 15:29:08
    Author     : lalo2
--%>
<%@page import="com.progra.guia.presentation.coberturas.Model"%>
<%@page import="com.progra.guia.logic.Cobertura"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    Model model = (Model) request.getAttribute("model");
    List<Cobertura> coberturasList = model.getCoberturas();
    
%>


<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="/presentation/Head.jsp" %>

        <title>Administrator Page</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>List of Coberturas</h1>

        <table>
            <tr>
                <th>ID</th>
                <th>Description</th>
                <th>Precio Minimo</th>
                <th>Precio Porcentual</th>
            </tr>

            <%-- Iterate over the list of coberturas and display them --%>
            <% for(Cobertura cobertura : coberturasList) { %>
            <tr>
                <td><%=cobertura.getId()%></td>
                <td><%=cobertura.getDescripcion()%></td>
                <td><%=cobertura.getCostoMinimo()%></td>
                <td><%=cobertura.getCostoPorcentual()%></td>
                <td>
                </td>
            </tr>
            <% } %>
        </table>

        <a href="presentation/cliente/agregacobertura">Add new cobertura</a>
        
        
        <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>

