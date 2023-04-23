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
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Model model = (Model) request.getAttribute("model");
    List<Marca> marcas = model.getMarcas();
    
%>

<!DOCTYPE html>
<html>
    <head>
         <%@ include file="/presentation/Head.jsp" %>
        <title>Agregar Cobertura</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Agregar Modelo</h1>
        <form action="presentation/admin/modelos/AgregarModelo.jsp" method="POST">
            <label for="descripcion">Modelo:</label>
            <input type="text" id="descripcion" name="descripcion" required><br><br>
            <select id="marca" name="marca">
                <% 
                 for(Marca marca : marcas) {
                    %>
                    <option value="<%= marca.getId() %>"><%= marca.getDescripcion() %></option>
                    <%
                }
                %>
            </select><br><br>
            
            <button type="submit">Agregar Modelo</button>
        </form>
         <%@ include file="/presentation/Footer.jsp" %>
    </body>   
    
 <%--    <head>
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
    </body>--%>
</html>
