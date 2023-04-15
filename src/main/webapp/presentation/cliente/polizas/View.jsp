
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
        <input type="text" class="search-input" placeholder="Search...">
        <button class="search-button">Search</button>
    </div>

    
    
    
    
    
    
    <div style="width:50%;margin:auto;">
        <h1>Listado de Polizas del Cliente</h1>     
    
        <table>
            <thead>
                <tr>
                    <th style="td">Placa</td>
                    <th style="td">Fecha </td>
                    <th style="td"> Auto </td>
                    <th style="td">Valor </td>
                </tr>
            </thead>
            <tbody>
                <% for(Poliza p : polizas) { %>
                    <tr>
                        <td><a href="presentation/cliente/polizas/show?numeroFld=<%=p.getNumeroPlaca()%>"><%=p.getNumeroPlaca()%></a></td>  
                        <td><%=p.getFechaInicio()%></td>
                        <td><%=p.getMarcaModelo()%></td>
                        <td><%=p.getValorAsegurado()%></td>
                    </tr>
                <% } %>
            </tbody>
        </table>          
    </div> 
    </div> 
     <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>








