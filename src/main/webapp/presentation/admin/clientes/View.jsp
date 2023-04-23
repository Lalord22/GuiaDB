<%-- 
    Document   : View
    Created on : 22 abr. 2023, 18:38:26
    Author     : Daniela Madrigal
--%>

<%@page import="com.progra.guia.presentation.clientes.Model"%>
<%@page import="com.progra.guia.logic.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    Model model = (Model) request.getAttribute("model");
    List<Cliente> clienteList = model.getClientes();
    
%>


<!DOCTYPE html>
<html>
    <head>    
        <%@ include file="/presentation/Head.jsp" %>

        <title>Administrator Page</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Lista de Clientes y Polizas</h1>

        <table>
            <tr>
                <th>Cédula</th>
                <th>Nombre</th> 
                <th>Télefono</th>
                <th>Correo</th>
                <th>Datos Tarjeta</th>
            </tr>


            <% for(Cliente cliente : clienteList) { %>
            <% if (cliente.getUsuario().getTipo() != 2){%>
            <tr>
                <td><a href="presentation/clientes/showPolizas?cedulaFld=<%=cliente.getCedula()%>"><%=cliente.getCedula()%></a></td>
                <td><%=cliente.getNombre()%></td>
                <td><%=cliente.getTelefono()%></td>
                <td><%=cliente.getCorreo()%></td>
                <td><%=cliente.getDatosTarjeta()%></td>
            </tr>

            <%}%>
            <% } %>
        </table>

       
        
        <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>