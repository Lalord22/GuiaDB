<%@page import="com.progra.guia.logic.Modelo"%>
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

    
    <form action="presentation/cliente/polizas/search" method="post">
    <div class="search-container">
        <label for="placa">Placa:</label>
        <input type="text" id="placa" name="placa" placeholder="Placa" required>
        <input type="hidden" name="accion" value="buscar">
        <input type="submit" value="Buscar" class="submit">
    </div>
</form>

    
    <div style="width:50%;margin:auto;">
        <h1>Listado de Polizas del Cliente</h1>     
    
        <table>
            <thead>
                <tr>
                    <th style="td">Placa</th>
                    <th style="td">Id</th>
                    <th style="td">Fecha </th>
                    <th style="td">Auto </th>
                    <th style="td"> Valor </th>
                </tr>
            </thead>
            <tbody>
                <% for(Poliza p : polizas) { %>
                    <tr>
                        
                        <td><a href="presentation/cliente/poliza/show?numeroFld=<%=p.getId()%>"><%=p.getNumeroPlaca()%></a></td>  
                        <td><%=p.getId()%></td>
                        <td><%=p.getFechaInicio()%></td>
                   
                        <th style="td"><%= p.getModelo().getDescripcion() %></th>
                        
                        <td><%=p.getValorAsegurado()%></td>
                        
                    </tr>
                <% } %>
            </tbody>
        </table>          
    </div>  
     <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>








