<%-- 
    Document   : AgregarCategoria
    Created on : Apr 21, 2023, 9:39:44 PM
    Author     : lalo2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@ include file="/presentation/Head.jsp" %>
        <title>Add Categoria</title>
    </head>
    <body>
        <%@ include file="/presentation/Header.jsp" %>
        <h1>Add Categoria</h1>
        <form action="admin/addCategoria" method="POST">
            <label for="descripcion">Descripcion:</label>
            <input type="text" id="descripcion" name="descripcion" required><br><br>
            <button type="submit">Add Categoria</button>
        </form>
         <%@ include file="/presentation/Footer.jsp" %>
    </body>
</html>
