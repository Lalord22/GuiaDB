<%-- 
    Document   : Compra
    Created on : Apr 19, 2023, 4:47:13 PM
    Author     : lalo2
--%>
<%@page import="com.progra.guia.logic.Poliza"%>
<%@page import="com.progra.guia.presentation.cliente.Poliza.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html>
<head>
        <%@ include file="/presentation/Head.jsp" %>
	<meta charset="UTF-8">
	<title>Compra de Poliza</title>
</head>
<body>
        <%@ include file="/presentation/Header.jsp" %>
	<form action="ComprarPoliza" method="POST">
              <div class="panel" style="width:35%;">
                <div class="fila encabezado">Compra de Poliza</div>
                <div class="fila">
                    <div class="etiqueta">Placa</div>
                    <div class="campo"><input type="text" id="numeroPlaca" name="numeroPlaca" required><br></div>
                    
                   <div class="etiqueta">Marca</div>
                   <div class="campo"><input type="text" id="marca" name="marca" required><br></div>
                   
                    <div class="etiqueta">Modelo</div>
                    <div class="campo"> <input type="text" id="modelo" name="modelo" required><br> </div>
                    
                    <div class="etiqueta">Año de Fabricacion</div>
                    <div class="campo"><input type="number" id="year" name="year" required><br></div>
                    
                    <div class="etiqueta">Valor Asegurado</div>
                    <div class="campo"><input type="number" id="valorAsegurado" name="valorAsegurado" required><br></div>
                    
                    <div class="etiqueta">Periodo de Pago</div>
                    <div class="campo"><select id="periodoPago" name="periodoPago">
			<option value="trimestral">Trimestral</option>
			<option value="semestral">Semestral</option>
			<option value="anual">Anual</option>
                    </select><br></div>
                        
                    <div class="etiqueta">Fecha de Inicio</div>
                    <div class="campo"><input type="date" id="fechaInicio" name="fechaInicio" required><br></div>
                    
                </div>
                <div class="fila encabezado"><input type="submit" value="Comprar Poliza"> </div>
         </div>
	</form>
<%@ include file="/presentation/Footer.jsp" %>
</body>
</html>
