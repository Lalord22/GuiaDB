
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

    <div style="width:50%;margin:auto;">
        <h1>Listado de Polizas del Cliente</h1>     
    
        <table>
            <thead>
                <tr> <td>Numero Placa </td> <td> Fecha </td> <td>           Auto </td> <td>          Valor </td>  </tr>
            </thead>
            <tbody>
                        <% for(Poliza p:polizas){%>
                <tr> <td><a href="presentation/cliente/polizas/show?numeroFld=<%=p.getNumeroPlaca()%>"><%=p.getNumeroPlaca()%> </td>  
                   
                        <td><%=p.getFechaInicio()%></td></tr> 
                
                        <td><%=p.getMarcaModelo()%></td></tr> 

                        <td><%=p.getValorAsegurado()%></td></tr> 
<!--                         <tr> <td><form action="/Guia/presentation/cliente/poliza/show">
                                    <input type="hidden" name="numeroFld" value="<%=p.getNumeroPlaca()%>"> 
                                    <button class="link-button"> <%=p.getNumeroPlaca()%> </button> </form> </td>  
                            <td><%=p.getValorAsegurado()%></td></tr>  -->              
                        <%}%>
            </tbody>
        </table>          
    </div> 
     <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>








