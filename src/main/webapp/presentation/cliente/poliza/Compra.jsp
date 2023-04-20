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
	<h1>Compra de Poliza</h1>
	<form action="ComprarPoliza" method="POST">
		<label for="numeroPlaca">Numero de Placa:</label>
		<input type="text" id="numeroPlaca" name="numeroPlaca" required><br>
		<label for="marca">Marca:</label>
		<input type="text" id="marca" name="marca" required><br>
		<label for="modelo">Modelo:</label>
		<input type="text" id="modelo" name="modelo" required><br>
		<label for="year">Año de Fabricación:</label>
		<input type="number" id="year" name="year" required><br>
		<label for="valorAsegurado">Valor Asegurado:</label>
		<input type="number" id="valorAsegurado" name="valorAsegurado" required><br>
		<label for="periodoPago">Periodo de Pago:</label>
		<select id="periodoPago" name="periodoPago">
			<option value="trimestral">Trimestral</option>
			<option value="semestral">Semestral</option>
			<option value="anual">Anual</option>
		</select><br>
		<label for="fechaInicio">Fecha de Inicio:</label>
		<input type="date" id="fechaInicio" name="fechaInicio" required><br>
		<input type="submit" value="Comprar Poliza">
	</form>
<%@ include file="/presentation/Footer.jsp" %>
</body>
</html>
