<%-- 
    Document   : registrationSuccess
    Created on : Apr 10, 2023, 12:46:54 AM
    Author     : lalo2
--%>

<%@page import="com.progra.guia.presentation.login.Model"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
            <head>
                <%@ include file="/presentation/Head.jsp" %>
            <title>Registration Success</title>
            </head>
            <body>
                <%@ include file="/presentation/Head.jsp" %>
                <h1>Registro exitoso</h1>
            <p>Presione el boton para regresar al la pantalla de Inicio</p>
            <form method='post' action="/GuiaDB/presentation/login/show">
            <input type='submit' value='Finalizar'>
            </form>
            <%@ include file="/presentation/Footer.jsp" %>
            </body>
</html>
