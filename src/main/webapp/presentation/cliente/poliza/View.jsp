
<%@page import="com.progra.guia.logic.Poliza"%>
<%@page import="com.progra.guia.presentation.cliente.poliza.Model"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    Model model = (Model) request.getAttribute("model");
    Poliza poliza = model.getCurrent();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <%@ include file="/presentation/Head.jsp" %>
 <title>Poliza</title> 
</head>
<body >
<%@ include file="/presentation/Header.jsp" %>

    <div class="panel" style="width:50%;">
        <div class="fila encabezado">Poliza</div>
        <div class="fila">
               <div class="etiqueta">Numero</div>
              <div class="campo"><%=poliza.getNumeroPlaca()%></div>
        </div>
        <div class="fila">
          <div class="etiqueta">Valor</div>
          <div class="campo"><%=poliza.getValorAsegurado()%></div>
        </div>
    </div>     
     <%@ include file="/presentation/Footer.jsp" %>
</body>
</html>








