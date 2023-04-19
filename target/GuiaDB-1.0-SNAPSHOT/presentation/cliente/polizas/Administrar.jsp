<%-- 
    Document   : Administrar
    Created on : Apr 19, 2023, 5:31:14 PM
    Author     : lalo2
--%>


<%@page import="com.progra.guia.logic.Poliza"%>
<%@page import="com.progra.guia.presentation.cliente.Poliza.Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
                <%@ include file="/presentation/Head.jsp" %>
	<meta charset="UTF-8">
	<title>Administrator Dashboard</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			margin: 0;
			padding: 0;
		}
		
		nav {
			background-color: #ddd;
			padding: 10px;
		}
		nav ul {
			margin: 0;
			padding: 0;
			list-style: none;
			display: flex;
			flex-wrap: wrap;
		}
		nav li {
			margin-right: 10px;
		}
		nav a {
			color: #333;
			text-decoration: none;
			padding: 10px;
			display: block;
		}
		h1 {
			margin: 20px 0;
		}
		table {
			border-collapse: collapse;
			width: 100%;
			margin-bottom: 20px;
		}
		table th, table td {
			border: 1px solid #ddd;
			padding: 10px;
			text-align: left;
		}
		table th {
			background-color: #f2f2f2;
			font-weight: normal;
		}
		.button {
			background-color: #333;
			color: #fff;
			border: none;
			padding: 10px 20px;
			border-radius: 5px;
			cursor: pointer;
			font-size: 1.2em;
		}
	</style>
</head>
<body>
	 <%@ include file="/presentation/Header.jsp" %>
	<nav>
		<ul>
			<li><a href="#">Car Brands and Models</a></li>
			<li><a href="#">Categories and Types of Coberturas</a></li>
			<li><a href="#">Clients and Polizas List</a></li>
		</ul>
	</nav>
	<main>
		<h1>Welcome Administrator!</h1>
		<p>Please select an option from the menu above.</p>
	</main>
</body>
</html>
