<%-- 
    Document   : AgregarModelo
    Created on : 22 abr. 2023, 20:17:34
    Author     : Jennifer Lobo
--%>

<%@page import="com.progra.guia.logic.Modelo"%>
<%@page import="com.progra.guia.logic.Marca"%>
<%@page import="com.progra.guia.presentation.cliente.modelos.Model"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/presentation/Head.jsp" %>
	<meta charset="UTF-8">
	<title>Añadir Modelo</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
	<form action="presentation/cliente/modelos/agregar" method="POST" >
              <div class="panel" style="width:35%;">
                <div class="fila encabezado">Agregar Modelo</div>
                <div class="fila">
                    <div class="etiqueta">Modelo</div>
                    <div class="campo"><input type="text" id="modelo" name="modelo" required><br></div>
                    
                   <div class="etiqueta">Marca</div>
                   <div class="campo"><input type="text" id="marca" name="marca" required><br></div>
                   
                   <div class="etiqueta">Imagen</div>
                   
                </div>
                <div class="fila encabezado"><input type="submit" value="Agregar Modelo"> </div>
         </div>
	</form>
             
    <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>
