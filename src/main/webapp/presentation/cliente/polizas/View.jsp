
<%@page import="com.progra.guia.logic.Poliza"%>
<%@page import="com.progra.guia.presentation.cliente.polizas.Model"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%
    Model model = (Model) request.getAttribute("model");
    List<Poliza> polizas = model.getPolizas();
    Usuario usuario = (Usuario) session.getAttribute("usuario");
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

    
    <div style="width:50%;margin:auto;">
        <h1>Listado de Polizas del Cliente</h1>     
    
        <table>
            <thead>
                <tr>
                    <th style="td">Id</th>
                    <th style="td">Placa</th>
                    <th style="td">Fecha </th>
                    <th style="td"> Auto </th>
                    <th style="td">Valor </th>
                </tr>
            </thead>
            <tbody>
                <% for(Poliza p : polizas) { %>
                    <tr>
                        //modifique esto (daniela)
                        <td><a href="presentation/cliente/polizas/show?numeroFld=<%=p.getNumeroPlaca()%>"><%=p.getNumeroPlaca()%></a></td>  
                        <td><%=p.getId()%></td>
                        <td><%=p.getFechaInicio()%></td>
                        
                        <td><%=p.getValorAsegurado()%></td>
                    </tr>
                <% } %>
            </tbody>
        </table>          
    </div>  
     <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>








