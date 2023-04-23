<%-- 
    Document   : View
    Created on : 21 abr. 2023, 16:45:03
    Author     : Jennifer Lobo
--%>

<%-- --%>
<%@page import="com.progra.guia.logic.Modelo"%>
<%@page import="com.progra.guia.presentation.cliente.modelos.Model"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%
    Model model = (Model) request.getAttribute("model");
    List<Modelo> modelos = model.getModelos();
    
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/presentation/Head.jsp" %>
 <title>Modelos</title> 
</head>
<body >
    <%@ include file="/presentation/Header.jsp" %>
    <div style="width:90%;margin: 0 auto;">
       <div style="display: inline-flex;">
            <p class="misPolizas" style="margin-right: 10px;">Agregar Modelo</p>
            <a href="presentation/cliente/modelos/agregarMarca" class="logoIndex"><img src="images/mas.png" style="padding-left: 10px;"></a>
    </div>
        <table style="width: 100%; font-size: 14px; letter-spacing: 0.5px;">
            <thead>
                <tr>
                    <th style="width: 15%; text-align: center; border-bottom: 1px solid black;">Número</th>
                    <th style="width: 20%; text-align: center; border-bottom: 1px solid black;">Modelo</th>
                    <th style="width: 30%; text-align: center; border-bottom: 1px solid black;">Marca </th>
                    <th style="width: 25%; text-align: center; border-bottom: 1px solid black;">Imagen Auto </th>
                </tr>
            </thead>
            <tbody>
                <% for(Modelo p : modelos) { %>
                    <tr>
                        <td style="width: 15%; text-align: center;"><%=p.getId()%></td>
                        <%--  <td style="width: 20%; text-align: center;"><a href="presentation/cliente/poliza/show?numeroFld=<%=p.getId()%>"><%=p.getNumeroPlaca()%></a></td>  
                         --%>
                        <td style="width: 20%; text-align: center;"><%=p.getDescripcion()%></a></td>  
                        <td style="width: 30%; text-align: center;"><%=p.getMarca().getDescripcion()%></td>        
                    </tr>
                <% } %>
            </tbody>
        </table>          
    </div>  
     <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>
