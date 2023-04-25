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
    </head>
<body >
     <%@ include file="/presentation/Header.jsp" %>
    <div class="panel" style="width:30%;">
        <div class="fila encabezado">Registro exitoso</div>
        <div class="fila">Presione el botón para regresar a la pantalla de inicio</div>
        <div>
        <a class="fila encabezado" href="/GuiaDB/presentation/login/show" style="float:right; display: block; clear: both; margin-bottom: : -30px;">Finalizar</a>
        </div>
    </div>>

    <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>
