<%-- 
    Document   : AgregarMarca
    Created on : 22 abr. 2023, 22:08:24
    Author     : Jennifer Lobo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@ include file="/presentation/Head.jsp" %>
        <title>Agregar Marca</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Agregar Marca</h1>
        <form action="presentation/cliente/modelos/agregarMarca" method="POST">
            <label for="descripcion">Descripcion:</label>
            <input type="text" id="descripcion" name="descripcion" required><br><br>
            <button type="submit">Agregar</button>
        </form>
         <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>
