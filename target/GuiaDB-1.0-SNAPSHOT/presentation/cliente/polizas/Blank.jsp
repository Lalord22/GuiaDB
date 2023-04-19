
<%@page import="com.progra.guia.logic.Poliza"%>
<%@page import="com.progra.guia.presentation.cliente.polizas.Model"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%
    Model model = (Model) request.getAttribute("model");
    List<Poliza> polizas = model.getPolizas();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/presentation/Head.jsp" %>
 <title>Polizas</title> 
</head>
<body >
    <%@ include file="/presentation/Header.jsp" %>

    <div class="search-container">
        <input type="text" class="search-input" placeholder="Placa de vehiculo">
        <button class="search-button">Buscar</button>
    </div>
    
    
    <form action="presentation/cliente/polizas/show">
        
       <button class="search-button" >Ver todas las polizas</button>
       
    </form>
    
    
    
    </div> 
     <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>








