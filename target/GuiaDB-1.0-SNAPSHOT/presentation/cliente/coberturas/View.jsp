<%-- 
    Document   : View
    Created on : 20 abr. 2023, 15:29:08
    Author     : lalo2
--%>
<%@page import="com.progra.guia.logic.Cobertura"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator Page</title>
</head>
<body>
    <h1>List of Coberturas</h1>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        
        <%-- Iterate over the list of coberturas and display them --%>
        <% for(Cobertura cobertura : coberturasList) { %>
            <tr>
                <td><%=cobertura.getId("1")%></td>
                <td><%=cobertura.getDescription("Robo")%></td>
                <td><%=cobertura.getCostoMinimo(300)%></td>
                <td>
                    <a href="editCobertura.jsp?id=<%=cobertura.getId()%>">Edit</a>
                    <a href="deleteCobertura.jsp?id=<%=cobertura.getId()%>">Delete</a>
                </td>
            </tr>
        <% } %>
    </table>
    
    <a href="addCobertura.jsp">Add new cobertura</a>
    
</body>
</html>

